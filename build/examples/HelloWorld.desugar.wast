(module
  (type $FUNCSIG$v (func))
  (type $FUNCSIG$i (func (result i32)))
  (type $FUNCSIG$vii (func (param i32 i32)))
  (type $FUNCSIG$ii (func (param i32) (result i32)))
  (import "env" "_ZN17_ContractFeaturesI20_feature_has_storage21_feature_no_dyninvokeE6deployEv" (func $_ZN17_ContractFeaturesI20_feature_has_storage21_feature_no_dyninvokeE6deployEv))
  (import "env" "_ZN6neodev13smartcontract9framework8services3neo7Storage10getContextINS_36_emit_syscall_Neo_Storage_GetContextEEENS3_14StorageContextEv" (func $_ZN6neodev13smartcontract9framework8services3neo7Storage10getContextINS_36_emit_syscall_Neo_Storage_GetContextEEENS3_14StorageContextEv))
  (import "env" "_ZN6neodev13smartcontract9framework8services3neo7Storage3putINS_29_emit_syscall_Neo_Storage_PutEEEvNS3_14StorageContextENS_7abitype6StringES9_" (func $_ZN6neodev13smartcontract9framework8services3neo7Storage3putINS_29_emit_syscall_Neo_Storage_PutEEEvNS3_14StorageContextENS_7abitype6StringES9_ (param i32 i32)))
  (import "env" "_ZN6neodev6vmtype5Array4initINS_7_noemitEEERS1_v" (func $_ZN6neodev6vmtype5Array4initINS_7_noemitEEERS1_v (result i32)))
  (import "env" "_ZN6neodev7abitype3strINS_15_convert_StringEEENS0_6StringEPKc" (func $_ZN6neodev7abitype3strINS_15_convert_StringEEENS0_6StringEPKc (param i32) (result i32)))
  (import "env" "_ZN6neodev7abitype6String4initEv" (func $_ZN6neodev7abitype6String4initEv (result i32)))
  (table $T0 0 anyfunc)
  (memory $0 1)
  (data (i32.const 32) "Hello\00")
  (data (i32.const 48) "World\00")
  (export "memory" (memory $0))
  (export "main" (func $main))
  (func $main (result i32)
    call $_ZN17_ContractFeaturesI20_feature_has_storage21_feature_no_dyninvokeE6deployEv
    call $_ZN6neodev7abitype6String4initEv
    call $_ZN6neodev6vmtype5Array4initINS_7_noemitEEERS1_v
    call $_ZN11NeoContract4mainI15emit_entrypointEEvN6neodev7abitype6StringERNS2_6vmtype5ArrayE
    i32.const 0)
  (func $_ZN11NeoContract4mainI15emit_entrypointEEvN6neodev7abitype6StringERNS2_6vmtype5ArrayE (param $0 i32) (param $1 i32)
    call $_ZN6neodev13smartcontract9framework8services3neo7Storage10getContextINS_36_emit_syscall_Neo_Storage_GetContextEEENS3_14StorageContextEv
    i32.const 32
    call $_ZN6neodev7abitype3strINS_15_convert_StringEEENS0_6StringEPKc
    i32.const 48
    call $_ZN6neodev7abitype3strINS_15_convert_StringEEENS0_6StringEPKc
    call $_ZN6neodev13smartcontract9framework8services3neo7Storage3putINS_29_emit_syscall_Neo_Storage_PutEEEvNS3_14StorageContextENS_7abitype6StringES9_))
