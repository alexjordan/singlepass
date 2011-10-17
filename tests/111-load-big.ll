; ModuleID = 'DSPstone/fft/main16_bit_reduct.bc'
target datalayout = "e-p:32:32:32-i8:8:8-i16:16:16-i32:32:32-f32:32:32-f64:64:64-n32"
target triple = "tms320c64x-unknown-gnu-linux"

@OptEdgeProfCounters = internal global [66 x i32] [i32 -1, i32 -1, i32 7, i32 -1, i32 -1, i32 0, i32 0, i32 -1, i32 -1, i32 -1, i32 0, i32 0, i32 -1, i32 -1, i32 -1, i32 -1, i32 0, i32 -1, i32 -1, i32 0, i32 -1, i32 -1, i32 -1, i32 0, i32 0, i32 -1, i32 0, i32 -1, i32 -1, i32 -1, i32 -1, i32 0, i32 0, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 0, i32 -1, i32 -1, i32 0, i32 -1, i32 0, i32 -1, i32 -1, i32 0, i32 -1, i32 -1, i32 -1, i32 0, i32 -1, i32 -1, i32 0, i32 -1, i32 -1, i32 0, i32 -1, i32 41, i32 42]

define i32 @main(i32 %argc, i8** %argv) nounwind {
entry:
  %OldFuncCounter = load i32* getelementptr inbounds ([66 x i32]* @OptEdgeProfCounters, i32 0, i32 65)
  ret i32 %OldFuncCounter
}

