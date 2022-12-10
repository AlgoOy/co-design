; ModuleID = 'C:/Users/24073/Desktop/temp_hw/project_2/vender/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"struct.ap_int<3>" = type { %"struct.ap_int_base<3, true>" }
%"struct.ap_int_base<3, true>" = type { %"struct.ssdm_int<3, true>" }
%"struct.ssdm_int<3, true>" = type { i3 }
%"struct.ap_int<2>" = type { %"struct.ap_int_base<2, true>" }
%"struct.ap_int_base<2, true>" = type { %"struct.ssdm_int<2, true>" }
%"struct.ssdm_int<2, true>" = type { i2 }

; Function Attrs: argmemonly noinline
define void @apatb_balance_ir(%"struct.ap_int<3>"* noalias nocapture nonnull %sum, %"struct.ap_int<2>"* nocapture readonly %cash, %"struct.ap_int<2>"* noalias nocapture nonnull %tissue) local_unnamed_addr #0 {
entry:
  %sum_copy = alloca i3, align 512
  %tissue_copy = alloca i2, align 512
  call fastcc void @copy_in(%"struct.ap_int<3>"* nonnull %sum, i3* nonnull align 512 %sum_copy, %"struct.ap_int<2>"* nonnull %tissue, i2* nonnull align 512 %tissue_copy)
  call void @apatb_balance_hw(i3* %sum_copy, %"struct.ap_int<2>"* %cash, i2* %tissue_copy)
  call void @copy_back(%"struct.ap_int<3>"* %sum, i3* %sum_copy, %"struct.ap_int<2>"* %tissue, i2* %tissue_copy)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_in(%"struct.ap_int<3>"* noalias readonly "unpacked"="0", i3* noalias nocapture align 512 "unpacked"="1.0.0.0", %"struct.ap_int<2>"* noalias readonly "unpacked"="2", i2* noalias nocapture align 512 "unpacked"="3.0.0.0") unnamed_addr #1 {
entry:
  call fastcc void @"onebyonecpy_hls.p0struct.ap_int<3>.29"(i3* align 512 %1, %"struct.ap_int<3>"* %0)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_int<2>"(i2* align 512 %3, %"struct.ap_int<2>"* %2)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_out(%"struct.ap_int<3>"* noalias "unpacked"="0", i3* noalias nocapture readonly align 512 "unpacked"="1.0.0.0", %"struct.ap_int<2>"* noalias "unpacked"="2", i2* noalias nocapture readonly align 512 "unpacked"="3.0.0.0") unnamed_addr #2 {
entry:
  call fastcc void @"onebyonecpy_hls.p0struct.ap_int<3>"(%"struct.ap_int<3>"* %0, i3* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_int<2>.4"(%"struct.ap_int<2>"* %2, i2* align 512 %3)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_int<2>.4"(%"struct.ap_int<2>"* noalias "unpacked"="0", i2* noalias nocapture readonly align 512 "unpacked"="1.0.0.0") unnamed_addr #3 {
entry:
  %2 = icmp eq %"struct.ap_int<2>"* %0, null
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %.01.0.05 = getelementptr %"struct.ap_int<2>", %"struct.ap_int<2>"* %0, i32 0, i32 0, i32 0, i32 0
  %3 = bitcast i2* %1 to i8*
  %4 = load i8, i8* %3
  %5 = trunc i8 %4 to i2
  store i2 %5, i2* %.01.0.05, align 1
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_int<2>"(i2* noalias nocapture align 512 "unpacked"="0.0.0.0", %"struct.ap_int<2>"* noalias readonly "unpacked"="1") unnamed_addr #3 {
entry:
  %2 = icmp eq %"struct.ap_int<2>"* %1, null
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %.0.0.04 = getelementptr %"struct.ap_int<2>", %"struct.ap_int<2>"* %1, i32 0, i32 0, i32 0, i32 0
  %3 = bitcast i2* %.0.0.04 to i8*
  %4 = load i8, i8* %3
  %5 = trunc i8 %4 to i2
  store i2 %5, i2* %0, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_int<3>.29"(i3* noalias nocapture align 512 "unpacked"="0.0.0.0", %"struct.ap_int<3>"* noalias readonly "unpacked"="1") unnamed_addr #3 {
entry:
  %2 = icmp eq %"struct.ap_int<3>"* %1, null
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %.0.0.04 = getelementptr %"struct.ap_int<3>", %"struct.ap_int<3>"* %1, i32 0, i32 0, i32 0, i32 0
  %3 = bitcast i3* %.0.0.04 to i8*
  %4 = load i8, i8* %3
  %5 = trunc i8 %4 to i3
  store i3 %5, i3* %0, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_int<3>"(%"struct.ap_int<3>"* noalias "unpacked"="0", i3* noalias nocapture readonly align 512 "unpacked"="1.0.0.0") unnamed_addr #3 {
entry:
  %2 = icmp eq %"struct.ap_int<3>"* %0, null
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %.01.0.05 = getelementptr %"struct.ap_int<3>", %"struct.ap_int<3>"* %0, i32 0, i32 0, i32 0, i32 0
  %3 = bitcast i3* %1 to i8*
  %4 = load i8, i8* %3
  %5 = trunc i8 %4 to i3
  store i3 %5, i3* %.01.0.05, align 1
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

declare void @apatb_balance_hw(i3*, %"struct.ap_int<2>"*, i2*)

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_back(%"struct.ap_int<3>"* noalias "unpacked"="0", i3* noalias nocapture readonly align 512 "unpacked"="1.0.0.0", %"struct.ap_int<2>"* noalias "unpacked"="2", i2* noalias nocapture readonly align 512 "unpacked"="3.0.0.0") unnamed_addr #2 {
entry:
  call fastcc void @"onebyonecpy_hls.p0struct.ap_int<3>"(%"struct.ap_int<3>"* %0, i3* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_int<2>.4"(%"struct.ap_int<2>"* %2, i2* align 512 %3)
  ret void
}

define void @balance_hw_stub_wrapper(i3*, %"struct.ap_int<2>"*, i2*) #4 {
entry:
  %3 = alloca %"struct.ap_int<3>"
  %4 = alloca %"struct.ap_int<2>"
  call void @copy_out(%"struct.ap_int<3>"* %3, i3* %0, %"struct.ap_int<2>"* %4, i2* %2)
  call void @balance_hw_stub(%"struct.ap_int<3>"* %3, %"struct.ap_int<2>"* %1, %"struct.ap_int<2>"* %4)
  call void @copy_in(%"struct.ap_int<3>"* %3, i3* %0, %"struct.ap_int<2>"* %4, i2* %2)
  ret void
}

declare void @balance_hw_stub(%"struct.ap_int<3>"*, %"struct.ap_int<2>"*, %"struct.ap_int<2>"*)

attributes #0 = { argmemonly noinline "fpga.wrapper.func"="wrapper" }
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
