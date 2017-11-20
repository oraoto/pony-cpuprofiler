use "collections"
use "package:../../cpuprofiler"

actor Counter
  var _count: U32

  new create() =>
    _count = 0

  be increment() =>
    _count = _count + 1

actor Main
  new create(env: Env) =>

    var count: U32 = try env.args(1)?.u32()? else 10000000 end
    var counter = Counter

    Profiler.start("counter.profile")
    for i in Range[U32](0, count) do
      counter.increment()
    end
    Profiler.stop()

