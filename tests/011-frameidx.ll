; ModuleID = '<stdin>'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128"
target triple = "x86_64-linux-gnu"

define i32 @main(i32 %argc, i8** %argv) {
entry:
	%foo.addr = alloca i32, align 4
	store i32 42, i32* %foo.addr
	%ld = load i32* %foo.addr
	ret i32 %ld
}
