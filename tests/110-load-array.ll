; ModuleID = '<stdin>'
target datalayout = "e-p:32:32:32-i8:8:8-i16:16:16-i32:32:32-f32:32:32-f64:64:64-n32"
target triple = "tms320c64x-unknown-gnu-linux"

@array = internal global [5 x i32] [i32 7, i32 8, i32 9, i32 10, i32 11]

define i32 @main(i32 %argc, i8** %argv) nounwind {
entry:
  %foo = load i32* getelementptr inbounds ([5 x i32]* @array, i32 0, i32 4)
  ret i32 %foo
}
