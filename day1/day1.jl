arr = []
open(joinpath(@__DIR__, "aoc2022_day1.txt")) do f
    var = 0
    while !eof(f)
        s = readline(f)
        t = tryparse(Int, s)
        if !isnothing(t)
            var += t
        else
            push!(arr, var)
            var = 0   
        end
    end
end

println(maximum(arr))

