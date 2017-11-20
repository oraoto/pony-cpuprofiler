use "lib:profiler"

primitive Profiler

  fun start(file: String) =>
    @ProfilerStart[I32](file.cstring())

  fun stop() =>
    @ProfilerStop[I32]()
