	.text
	.file	"/b/build/slave/linux/build/src/buildbot/work/gcc/gcc/testsuite/gcc.c-torture/execute/pr48717.c"
	.globl	foo
	.type	foo,@function
foo:                                    # @foo
	.param  	i32, i32
	.result 	i32
# BB#0:                                 # %entry
	i32.add 	$push0=, $1, $0
	i32.const	$push1=, 65535
	i32.and 	$push2=, $pop0, $pop1
	return  	$pop2
func_end0:
	.size	foo, func_end0-foo

	.globl	bar
	.type	bar,@function
bar:                                    # @bar
	.local  	i32, i32
# BB#0:                                 # %entry
	i32.const	$0=, 0
	i32.load	$1=, w($0)
	i32.const	$push0=, -1
	i32.xor 	$push1=, $1, $pop0
	i32.add 	$push2=, $pop1, $1
	i32.const	$push3=, 65535
	i32.and 	$push4=, $pop2, $pop3
	i32.store	$discard=, v($0), $pop4
	return
func_end1:
	.size	bar, func_end1-bar

	.globl	main
	.type	main,@function
main:                                   # @main
	.result 	i32
	.local  	i32, i32, i32
# BB#0:                                 # %entry
	i32.const	$0=, 0
	i32.load	$1=, w($0)
	i32.const	$2=, 65535
	block   	BB2_2
	i32.const	$push0=, -1
	i32.xor 	$push1=, $1, $pop0
	i32.add 	$push2=, $pop1, $1
	i32.and 	$push3=, $pop2, $2
	i32.store	$push4=, v($0), $pop3
	i32.ne  	$push5=, $pop4, $2
	br_if   	$pop5, BB2_2
# BB#1:                                 # %if.end
	return  	$0
BB2_2:                                  # %if.then
	call    	abort
	unreachable
func_end2:
	.size	main, func_end2-main

	.type	v,@object               # @v
	.data
	.globl	v
	.align	2
v:
	.int32	1                       # 0x1
	.size	v, 4

	.type	w,@object               # @w
	.bss
	.globl	w
	.align	2
w:
	.int32	0                       # 0x0
	.size	w, 4


	.ident	"clang version 3.8.0 "
	.section	".note.GNU-stack","",@progbits