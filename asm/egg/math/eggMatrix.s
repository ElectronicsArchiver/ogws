.include "macros.inc"

.section .ctors, "a"
.4byte __sinit_$$3eggMatrix_cpp

.section .sdata2, "a"
.balign 0x8
.global lbl_804C09C0
lbl_804C09C0:
	.single 0e1
.global lbl_804C09C4
lbl_804C09C4:
	.single 0e2
.global lbl_804C09C8
lbl_804C09C8:
	.single 0e0

.section .bss, "wa"
.balign 0x8
# Static 3x4 identity matrix
.global ident__Q23EGG9Matrix34f
ident__Q23EGG9Matrix34f:
	.skip 0x4
	.skip 0x4
	.skip 0x4
	.skip 0x4
	.skip 0x4
	.skip 0x4
	.skip 0x4
	.skip 0x4
	.skip 0x4
	.skip 0x4
	.skip 0x4
	.skip 0x4

.section .text, "ax"

.global __dt__Q23EGG9Matrix34fFv
__dt__Q23EGG9Matrix34fFv:
/* 800A21E8 0009D0E8  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800A21EC 0009D0EC  7C 08 02 A6 */	mflr r0
/* 800A21F0 0009D0F0  2C 03 00 00 */	cmpwi r3, 0
/* 800A21F4 0009D0F4  90 01 00 14 */	stw r0, 0x14(r1)
/* 800A21F8 0009D0F8  93 E1 00 0C */	stw r31, 0xc(r1)
/* 800A21FC 0009D0FC  7C 7F 1B 78 */	mr r31, r3
/* 800A2200 0009D100  41 82 00 10 */	beq lbl_800A2210
/* 800A2204 0009D104  2C 04 00 00 */	cmpwi r4, 0
/* 800A2208 0009D108  40 81 00 08 */	ble lbl_800A2210
/* 800A220C 0009D10C  48 00 10 79 */	bl __dl__FPv
lbl_800A2210:
/* 800A2210 0009D110  7F E3 FB 78 */	mr r3, r31
/* 800A2214 0009D114  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 800A2218 0009D118  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800A221C 0009D11C  7C 08 03 A6 */	mtlr r0
/* 800A2220 0009D120  38 21 00 10 */	addi r1, r1, 0x10
/* 800A2224 0009D124  4E 80 00 20 */	blr 

.global makeIdentity__Q23EGG9Matrix34fFv
makeIdentity__Q23EGG9Matrix34fFv:
/* 800A2228 0009D128  C0 22 8F A8 */	lfs f1, lbl_804C09C8-_SDA2_BASE_(r2)
/* 800A222C 0009D12C  C0 02 8F A0 */	lfs f0, lbl_804C09C0-_SDA2_BASE_(r2)
/* 800A2230 0009D130  D0 23 00 04 */	stfs f1, 4(r3)
/* 800A2234 0009D134  D0 23 00 08 */	stfs f1, 8(r3)
/* 800A2238 0009D138  D0 23 00 0C */	stfs f1, 0xc(r3)
/* 800A223C 0009D13C  D0 23 00 10 */	stfs f1, 0x10(r3)
/* 800A2240 0009D140  D0 23 00 18 */	stfs f1, 0x18(r3)
/* 800A2244 0009D144  D0 23 00 1C */	stfs f1, 0x1c(r3)
/* 800A2248 0009D148  D0 23 00 20 */	stfs f1, 0x20(r3)
/* 800A224C 0009D14C  D0 23 00 24 */	stfs f1, 0x24(r3)
/* 800A2250 0009D150  D0 23 00 2C */	stfs f1, 0x2c(r3)
/* 800A2254 0009D154  D0 03 00 28 */	stfs f0, 0x28(r3)
/* 800A2258 0009D158  D0 03 00 14 */	stfs f0, 0x14(r3)
/* 800A225C 0009D15C  D0 03 00 00 */	stfs f0, 0(r3)
/* 800A2260 0009D160  4E 80 00 20 */	blr 

.global makeQ__Q23EGG9Matrix34fFRCQ23EGG5Quatf
makeQ__Q23EGG9Matrix34fFRCQ23EGG5Quatf:
/* 800A2264 0009D164  C0 42 8F A4 */	lfs f2, lbl_804C09C4-_SDA2_BASE_(r2)
/* 800A2268 0009D168  C1 44 00 04 */	lfs f10, 4(r4)
/* 800A226C 0009D16C  C0 02 8F A8 */	lfs f0, lbl_804C09C8-_SDA2_BASE_(r2)
/* 800A2270 0009D170  ED 22 02 B2 */	fmuls f9, f2, f10
/* 800A2274 0009D174  C0 E4 00 00 */	lfs f7, 0(r4)
/* 800A2278 0009D178  C1 04 00 08 */	lfs f8, 8(r4)
/* 800A227C 0009D17C  EC C2 01 F2 */	fmuls f6, f2, f7
/* 800A2280 0009D180  C0 24 00 0C */	lfs f1, 0xc(r4)
/* 800A2284 0009D184  EC 62 02 32 */	fmuls f3, f2, f8
/* 800A2288 0009D188  EC A2 00 72 */	fmuls f5, f2, f1
/* 800A228C 0009D18C  C0 42 8F A0 */	lfs f2, lbl_804C09C0-_SDA2_BASE_(r2)
/* 800A2290 0009D190  ED 69 02 B2 */	fmuls f11, f9, f10
/* 800A2294 0009D194  EC 86 01 F2 */	fmuls f4, f6, f7
/* 800A2298 0009D198  D0 03 00 0C */	stfs f0, 0xc(r3)
/* 800A229C 0009D19C  EC 63 02 32 */	fmuls f3, f3, f8
/* 800A22A0 0009D1A0  EC 22 58 28 */	fsubs f1, f2, f11
/* 800A22A4 0009D1A4  D0 03 00 1C */	stfs f0, 0x1c(r3)
/* 800A22A8 0009D1A8  ED 86 02 B2 */	fmuls f12, f6, f10
/* 800A22AC 0009D1AC  D0 03 00 2C */	stfs f0, 0x2c(r3)
/* 800A22B0 0009D1B0  ED A5 02 32 */	fmuls f13, f5, f8
/* 800A22B4 0009D1B4  EC 42 20 28 */	fsubs f2, f2, f4
/* 800A22B8 0009D1B8  EC 01 18 28 */	fsubs f0, f1, f3
/* 800A22BC 0009D1BC  EC 8C 68 28 */	fsubs f4, f12, f13
/* 800A22C0 0009D1C0  EC 22 18 28 */	fsubs f1, f2, f3
/* 800A22C4 0009D1C4  EC 6C 68 2A */	fadds f3, f12, f13
/* 800A22C8 0009D1C8  D0 03 00 00 */	stfs f0, 0(r3)
/* 800A22CC 0009D1CC  EC 02 58 28 */	fsubs f0, f2, f11
/* 800A22D0 0009D1D0  EC 46 02 32 */	fmuls f2, f6, f8
/* 800A22D4 0009D1D4  D0 83 00 04 */	stfs f4, 4(r3)
/* 800A22D8 0009D1D8  EC C5 02 B2 */	fmuls f6, f5, f10
/* 800A22DC 0009D1DC  D0 63 00 10 */	stfs f3, 0x10(r3)
/* 800A22E0 0009D1E0  EC 89 02 32 */	fmuls f4, f9, f8
/* 800A22E4 0009D1E4  EC A5 01 F2 */	fmuls f5, f5, f7
/* 800A22E8 0009D1E8  EC 62 30 2A */	fadds f3, f2, f6
/* 800A22EC 0009D1EC  D0 23 00 14 */	stfs f1, 0x14(r3)
/* 800A22F0 0009D1F0  EC 22 30 28 */	fsubs f1, f2, f6
/* 800A22F4 0009D1F4  EC 44 28 28 */	fsubs f2, f4, f5
/* 800A22F8 0009D1F8  D0 03 00 28 */	stfs f0, 0x28(r3)
/* 800A22FC 0009D1FC  EC 04 28 2A */	fadds f0, f4, f5
/* 800A2300 0009D200  D0 63 00 08 */	stfs f3, 8(r3)
/* 800A2304 0009D204  D0 43 00 18 */	stfs f2, 0x18(r3)
/* 800A2308 0009D208  D0 23 00 20 */	stfs f1, 0x20(r3)
/* 800A230C 0009D20C  D0 03 00 24 */	stfs f0, 0x24(r3)
/* 800A2310 0009D210  4E 80 00 20 */	blr 

.global makeS__Q23EGG9Matrix34fFRCQ23EGG8Vector3f
makeS__Q23EGG9Matrix34fFRCQ23EGG8Vector3f:
/* 800A2314 0009D214  C0 42 8F A8 */	lfs f2, lbl_804C09C8-_SDA2_BASE_(r2)
/* 800A2318 0009D218  C0 64 00 00 */	lfs f3, 0(r4)
/* 800A231C 0009D21C  C0 24 00 04 */	lfs f1, 4(r4)
/* 800A2320 0009D220  C0 04 00 08 */	lfs f0, 8(r4)
/* 800A2324 0009D224  D0 63 00 00 */	stfs f3, 0(r3)
/* 800A2328 0009D228  D0 43 00 04 */	stfs f2, 4(r3)
/* 800A232C 0009D22C  D0 43 00 08 */	stfs f2, 8(r3)
/* 800A2330 0009D230  D0 43 00 10 */	stfs f2, 0x10(r3)
/* 800A2334 0009D234  D0 23 00 14 */	stfs f1, 0x14(r3)
/* 800A2338 0009D238  D0 43 00 18 */	stfs f2, 0x18(r3)
/* 800A233C 0009D23C  D0 43 00 20 */	stfs f2, 0x20(r3)
/* 800A2340 0009D240  D0 43 00 24 */	stfs f2, 0x24(r3)
/* 800A2344 0009D244  D0 03 00 28 */	stfs f0, 0x28(r3)
/* 800A2348 0009D248  D0 43 00 0C */	stfs f2, 0xc(r3)
/* 800A234C 0009D24C  D0 43 00 1C */	stfs f2, 0x1c(r3)
/* 800A2350 0009D250  D0 43 00 2C */	stfs f2, 0x2c(r3)
/* 800A2354 0009D254  4E 80 00 20 */	blr 

.global setAxisRotation__Q23EGG9Matrix34fFRCQ23EGG8Vector3ff
setAxisRotation__Q23EGG9Matrix34fFRCQ23EGG8Vector3ff:
/* 800A2358 0009D258  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 800A235C 0009D25C  7C 08 02 A6 */	mflr r0
/* 800A2360 0009D260  90 01 00 24 */	stw r0, 0x24(r1)
/* 800A2364 0009D264  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 800A2368 0009D268  7C 7F 1B 78 */	mr r31, r3
/* 800A236C 0009D26C  38 61 00 08 */	addi r3, r1, 8
/* 800A2370 0009D270  48 00 00 6D */	bl setAxisRotation__Q23EGG5QuatfFRCQ23EGG8Vector3ff
/* 800A2374 0009D274  7F E3 FB 78 */	mr r3, r31
/* 800A2378 0009D278  38 81 00 08 */	addi r4, r1, 8
/* 800A237C 0009D27C  4B FF FE E9 */	bl makeQ__Q23EGG9Matrix34fFRCQ23EGG5Quatf
/* 800A2380 0009D280  80 01 00 24 */	lwz r0, 0x24(r1)
/* 800A2384 0009D284  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 800A2388 0009D288  7C 08 03 A6 */	mtlr r0
/* 800A238C 0009D28C  38 21 00 20 */	addi r1, r1, 0x20
/* 800A2390 0009D290  4E 80 00 20 */	blr 

.global loadPosMtx__Q23EGG9Matrix34fFUl
loadPosMtx__Q23EGG9Matrix34fFUl:
/* 800A2394 0009D294  48 04 0E E8 */	b GXLoadPosMtxImm

# __sinit_\eggMatrix_cpp
.global __sinit_$$3eggMatrix_cpp
__sinit_$$3eggMatrix_cpp:
/* 800A2398 0009D298  3C 80 80 41 */	lis r4, ident__Q23EGG9Matrix34f@ha
/* 800A239C 0009D29C  C0 22 8F A0 */	lfs f1, lbl_804C09C0-_SDA2_BASE_(r2)
/* 800A23A0 0009D2A0  38 64 AA 60 */	addi r3, r4, ident__Q23EGG9Matrix34f@l
/* 800A23A4 0009D2A4  C0 02 8F A8 */	lfs f0, lbl_804C09C8-_SDA2_BASE_(r2)
/* 800A23A8 0009D2A8  D0 24 AA 60 */	stfs f1, -0x55a0(r4)
/* 800A23AC 0009D2AC  D0 03 00 04 */	stfs f0, 4(r3)
/* 800A23B0 0009D2B0  D0 03 00 08 */	stfs f0, 8(r3)
/* 800A23B4 0009D2B4  D0 03 00 0C */	stfs f0, 0xc(r3)
/* 800A23B8 0009D2B8  D0 03 00 10 */	stfs f0, 0x10(r3)
/* 800A23BC 0009D2BC  D0 23 00 14 */	stfs f1, 0x14(r3)
/* 800A23C0 0009D2C0  D0 03 00 18 */	stfs f0, 0x18(r3)
/* 800A23C4 0009D2C4  D0 03 00 1C */	stfs f0, 0x1c(r3)
/* 800A23C8 0009D2C8  D0 03 00 20 */	stfs f0, 0x20(r3)
/* 800A23CC 0009D2CC  D0 03 00 24 */	stfs f0, 0x24(r3)
/* 800A23D0 0009D2D0  D0 23 00 28 */	stfs f1, 0x28(r3)
/* 800A23D4 0009D2D4  D0 03 00 2C */	stfs f0, 0x2c(r3)
/* 800A23D8 0009D2D8  4E 80 00 20 */	blr 
