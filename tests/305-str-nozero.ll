; ModuleID = '305-str-nozero.c'
target datalayout = "e-p:32:32:32-i8:8:8-i16:16:16-i32:32:32-f32:32:32-f64:64:64-n32"
target triple = "tms320c64x-unknown-gnu-linux"

@hay = internal global i8* getelementptr inbounds ([17 x i8]* @.str1, i32 0, i32 0), align 4 ; <i8**> [#uses=1]
@needle = internal global i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), align 4 ; <i8**> [#uses=1]
@.str = private constant [6 x i8] c"needle"    ; <[6 x i8]*> [#uses=1]
@.str1 = private constant [17 x i8] c"hayhayhayhayhavy\00" ; <[17 x i8]*> [#uses=1]

define i32 @main(i32 %argc, i8** %argv) nounwind {
entry:
  %retval = alloca i32, align 4                   ; <i32*> [#uses=3]
  %argc.addr = alloca i32, align 4                ; <i32*> [#uses=1]
  %argv.addr = alloca i8**, align 4               ; <i8***> [#uses=1]
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr
  store i8** %argv, i8*** %argv.addr
  %tmp = load i8** @hay                           ; <i8*> [#uses=1]
  %call = call i32 @puts(i8* %tmp)                ; <i32> [#uses=0]
  %tmp1 = load i8** @needle                       ; <i8*> [#uses=1]
  %arrayidx = getelementptr inbounds i8* %tmp1, i32 6 ; <i8*> [#uses=1]
  %tmp2 = load i8* %arrayidx                      ; <i8> [#uses=1]
  %conv = sext i8 %tmp2 to i32                    ; <i32> [#uses=1]
  store i32 %conv, i32* %retval
  %0 = load i32* %retval                          ; <i32> [#uses=1]
  ret i32 %0
}

declare i32 @puts(i8*)
