// Import the DSS packages into our namespace to save on typing
importPackage(Packages.com.ti.debug.engine.scripting)
importPackage(Packages.com.ti.ccstudio.scripting.environment)
importPackage(Packages.java.lang)

// Create our scripting environment object - which is the main entry point into any script and
// the factory for creating other Scriptable ervers and Sessions
var script = ScriptingEnvironment.instance()

testEnv = {}
load(java.lang.System.getenv("UTIL_PATH") + "/getArgs.js");
getArgs()

// Create a log file in the current directory to log script execution
script.traceBegin("BreakpointsTestLog.xml", "DefaultStylesheet.xsl")

// Set our TimeOut
script.setScriptTimeout(15000)

// Log everything
//script.traceSetConsoleLevel(TraceLevel.ALL)
script.traceSetFileLevel(TraceLevel.ALL)

// Get the Debug Server and start a Debug Session
debugServer = script.getServer("DebugServer.1")
if (testEnv.setupCfgFile == null) {
	script.traceWrite("no target configuration given!")
    script.traceEnd()
    java.lang.System.exit(1);
}
debugServer.setConfig(testEnv.setupCfgFile)
debugSession = debugServer.openSession(".*")

// Load a program
// (ScriptingEnvironment has a concept of a working folder and for all of the APIs which take
// path names as arguments you can either pass a relative path or an absolute path)
debugSession.memory.loadProgram(testEnv.outFiles)

// Set a breakpoint at "main"
var main = debugSession.symbol.getAddress("main")
//var foo = debugSession.symbol.getAddress("foo")
var bp1 = debugSession.breakpoint.add(main)
var bp2 = 0

script.traceWrite("Main address: 0x" + Long.toHexString(main))
//script.traceWrite("Foo address: 0x" + Long.toHexString(foo))

// Restart our Target
debugSession.target.restart()

// Run if already not automatically halted at main.  Should halt at first BP
if(debugSession.expression.evaluate("PC") != main)
{
	debugSession.target.run()
}

nPC = debugSession.expression.evaluate("PC")

if (nPC == main) {
	script.traceWrite("SUCCESS: Halted at correct location")
	var ret = debugSession.memory.readRegister("B3")
	script.traceWrite("Return address: 0x" + Long.toHexString(ret))
	debugSession.breakpoint.add(ret)
} else {
	script.traceWrite("FAIL: Expected halt at bench_begin.")

	script.traceSetConsoleLevel(TraceLevel.INFO)
	script.traceWrite("TEST FAILED!")
	script.traceEnd()
	java.lang.System.exit(1);
}

// Run again.  Should halt at our breakpoint
var cycles = debugSession.clock.runBenchmark()

nPC = debugSession.expression.evaluate("PC")

if (nPC == ret) {
	script.traceWrite("SUCCESS: Halted at correct location")
	script.traceWrite("SUCCESS: retval = " + debugSession.memory.readRegister("A4"))
} else {
	script.traceWrite("FAIL: Expected halt at bench_end (0x" + Long.toHexString(ret) +").")
	script.traceWrite("FAIL: Actually halted at 0x" + Long.toHexString(nPC) + ".")

	script.traceSetConsoleLevel(TraceLevel.INFO)
	script.traceWrite("TEST FAILED!")
	script.traceEnd()
	java.lang.System.exit(1);
}

script.traceWrite("SUCCESS: took " + cycles + " cycles");

// All done
debugSession.terminate()
debugServer.stop()

script.traceSetConsoleLevel(TraceLevel.INFO)
script.traceWrite("TEST SUCCEEDED!")

// Stop logging and exit.
script.traceEnd()
java.lang.System.exit(0);
