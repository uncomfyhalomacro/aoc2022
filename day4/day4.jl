function getrangeintersects(x::AbstractString)
    extract = split(x, ",")
    sec_one = tryparse.(Int, (split(extract[1], "-")))
    sec_two = tryparse.(Int, (split(extract[2], "-")))
    range1 = sec_one[1]:sec_one[2]
    range2 = sec_two[1]:sec_two[2]
    return (range1, range2)
end

function isfullycontain(x::Tuple{UnitRange{Int64},UnitRange{Int64}})
    return intersect(collect(x[1]), collect(x[2])) in collect.(x)
end

function isoverlap(x::Tuple{UnitRange{Int64}, UnitRange{Int64}})
    !isempty(intersect(collect(x[1]), collect(x[2])))
end

function run()
    path = joinpath(@__DIR__, "aoc2022_day4.txt")
    # Part 1
    println(count(==(true), isfullycontain.(getrangeintersects.(eachline(path)))))
    
    # Part 2
    println(count(==(true), isoverlap.(getrangeintersects.(eachline(path)))))
end

run()