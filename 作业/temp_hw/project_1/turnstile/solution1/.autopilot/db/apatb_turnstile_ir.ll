; ModuleID = 'C:/Users/24073/Desktop/temp_hw/project_1/turnstile/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"struct.ap_int<1>" = type { %"struct.ap_int_base<1, true>" }
%"struct.ap_int_base<1, true>" = type { %"struct.ssdm_int<1, true>" }
%"struct.ssdm_int<1, true>" = type { i1 }

; Function Attrs: inaccessiblemem_or_argmemonly noinline
define void @apatb_turnstile_ir(%"struct.ap_int<1>"* noalias nocapture nonnull %lock, %"struct.ap_int<1>"* noalias nocapture nonnull %pass, %"struct.ap_int<1>"* noalias nocapture nonnull %brush) local_unnamed_addr #0 {
entry:
  %lock_copy = alloca i1, align 512
  %pass_copy = alloca i1, align 512
  %brush_copy = alloca i1, align 512
  call fastcc void @copy_in(%"struct.ap_int<1>"* nonnull %lock, i1* nonnull align 512 %lock_copy, %"struct.ap_int<1>"* nonnull %pass, i1* nonnull align 512 %pass_copy, %"struct.ap_int<1>"* nonnull %brush, i1* nonnull align 512 %brush_copy)
  call void @apatb_turnstile_hw(i1* %lock_copy, i1* %pass_copy, i1* %brush_copy)
  call void @copy_back(%"struct.ap_int<1>"* %lock, i1* %lock_copy, %"struct.ap_int<1>"* %pass, i1* %pass_copy, %"struct.ap_int<1>"* %brush, i1* %brush_copy)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_in(%"struct.ap_int<1>"* noalias readonly "unpacked"="0", i1* noalias nocapture align 512 "unpacked"="1.0.0.0", %"struct.ap_int<1>"* noalias readonly "unpacked"="2", i1* noalias nocapture align 512 "unpacked"="3.0.0.0", %"struct.ap_int<1>"* noalias readonly "unpacked"="4", i1* noalias nocapture align 512 "unpacked"="5.0.0.0") unnamed_addr #1 {
entry:
  call fastcc void @"onebyonecpy_hls.p0struct.ap_int<1>"(i1* align 512 %1, %"struct.ap_int<1>"* %0)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_int<1>"(i1* align 512 %3, %"struct.ap_int<1>"* %2)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_int<1>"(i1* align 512 %5, %"struct.ap_int<1>"* %4)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_out(%"struct.ap_int<1>"* noalias "unpacked"="0", i1* noalias nocapture readonly align 512 "unpacked"="1.0.0.0", %"struct.ap_int<1>"* noalias "unpacked"="2", i1* noalias nocapture readonly align 512 "unpacked"="3.0.0.0", %"struct.ap_int<1>"* noalias "unpacked"="4", i1* noalias nocapture readonly align 512 "unpacked"="5.0.0.0") unnamed_addr #2 {
entry:
  call fastcc void @"onebyonecpy_hls.p0struct.ap_int<1>.4.18.32"(%"struct.ap_int<1>"* %0, i1* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_int<1>.4.18.32"(%"struct.ap_int<1>"* %2, i1* align 512 %3)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_int<1>.4.18.32"(%"struct.ap_int<1>"* %4, i1* align 512 %5)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_int<1>.4.18.32"(%"struct.ap_int<1>"* noalias "unpacked"="0", i1* noalias nocapture readonly align 512 "unpacked"="1.0.0.0") unnamed_addr #3 {
entry:
  %2 = icmp eq %"struct.ap_int<1>"* %0, null
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %.01.0.05 = getelementptr %"struct.ap_int<1>", %"struct.ap_int<1>"* %0, i32 0, i32 0, i32 0, i32 0
  %3 = bitcast i1* %1 to i8*
  %4 = load i8, i8* %3
  %5 = trunc i8 %4 to i1
  store i1 %5, i1* %.01.0.05, align 1
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_int<1>"(i1* noalias nocapture align 512 "unpacked"="0.0.0.0", %"struct.ap_int<1>"* noalias readonly "unpacked"="1") unnamed_addr #3 {
entry:
  %2 = icmp eq %"struct.ap_int<1>"* %1, null
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %.0.0.04 = getelementptr %"struct.ap_int<1>", %"struct.ap_int<1>"* %1, i32 0, i32 0, i32 0, i32 0
  %3 = bitcast i1* %.0.0.04 to i8*
  %4 = load i8, i8* %3
  %5 = trunc i8 %4 to i1
  store i1 %5, i1* %0, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

declare void @apatb_turnstile_hw(i1*, i1*, i1*)

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_back(%"struct.ap_int<1>"* noalias "unpacked"="0", i1* noalias nocapture readonly align 512 "unpacked"="1.0.0.0", %"struct.ap_int<1>"* noalias "unpacked"="2", i1* noalias nocapture readonly align 512 "unpacked"="3.0.0.0", %"struct.ap_int<1>"* noalias "unpacked"="4", i1* noalias nocapture readonly align 512 "unpacked"="5.0.0.0") unnamed_addr #2 {
entry:
  call fastcc void @"onebyonecpy_hls.p0struct.ap_int<1>.4.18.32"(%"struct.ap_int<1>"* %0, i1* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_int<1>.4.18.32"(%"struct.ap_int<1>"* %2, i1* align 512 %3)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_int<1>.4.18.32"(%"struct.ap_int<1>"* %4, i1* align 512 %5)
  ret void
}

define void @turnstile_hw_stub_wrapper(i1*, i1*, i1*) #4 {
entry:
  %3 = alloca %"struct.ap_int<1>"
  %4 = alloca %"struct.ap_int<1>"
  %5 = alloca %"struct.ap_int<1>"
  call void @copy_out(%"struct.ap_int<1>"* %3, i1* %0, %"struct.ap_int<1>"* %4, i1* %1, %"struct.ap_int<1>"* %5, i1* %2)
  call void @turnstile_hw_stub(%"struct.ap_int<1>"* %3, %"struct.ap_int<1>"* %4, %"struct.ap_int<1>"* %5)
  call void @copy_in(%"struct.ap_int<1>"* %3, i1* %0, %"struct.ap_int<1>"* %4, i1* %1, %"struct.ap_int<1>"* %5, i1* %2)
  ret void
}

declare void @turnstile_hw_stub(%"struct.ap_int<1>"*, %"struct.ap_int<1>"*, %"struct.ap_int<1>"*)

attributes #0 = { inaccessiblemem_or_argmemonly noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyout" }
attributes #3 = { argmemonly noinline norecurse "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #4 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
