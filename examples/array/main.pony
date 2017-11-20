use "package:../../cpuprofiler"


actor Main
  """
  Array allocation example.

  1. Compile and run: ponyc && ./array
  2. Run pprof: pprof --text ./array array.profile

  Output:2. Run: ./array

  Using local file ./array.
  Using local file array.profile.
  Total: 11 samples
       8  72.7%  72.7%        8  72.7% __memset_sse2_unaligned_erms
       3  27.3% 100.0%       11 100.0% ponyint_pagemap_set_bulk
       0   0.0% 100.0%       11 100.0% Main_Dispatch
       0   0.0% 100.0%       11 100.0% __GI___clone
       0   0.0% 100.0%       11 100.0% ponyint_actor_run
       0   0.0% 100.0%       11 100.0% ponyint_heap_alloc_large
       0   0.0% 100.0%       11 100.0% run_thread
       0   0.0% 100.0%       11 100.0% start_thread
  """
  new create(env: Env) =>
    Profiler.start("array.profile")

    var i: USize = 0
    while i < 1024 do
      let arr = bigArray()
      i = i + 1
    end

    Profiler.stop()

  fun bigArray(): Array[U8 val] iso^ =>
    recover Array[U8].create(10000000) end

