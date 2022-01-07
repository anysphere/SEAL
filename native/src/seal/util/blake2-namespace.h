#pragma once

// the blake2 functions are C functions and hence not in a namespace.
// this makes them conflict with other libraries containing the same functions, such as libsodium.
// these defines remove the conflicts.

#define blake2b_init_param _seal_blake2b_init_param
#define blake2b_init _seal_blake2b_init
#define blake2b_init_key _seal_blake2b_init_key
#define blake2b_update _seal_blake2b_update
#define blake2b_final _seal_blake2b_final
#define blake2b _seal_blake2b