abstract type RuckSack end

struct FirstCompartment <: RuckSack
    items::AbstractString
    function FirstCompartment(x::String)
        new(x[begin:round(Int, length(x) / 2)])
    end
end

struct SecondCompartment <: RuckSack
    items::AbstractString
    function SecondCompartment(x::String)
        new(x[round(Int, length(x) / 2)+1:end])
    end
end

struct FullCompartment <: RuckSack
    first::FirstCompartment
    second::SecondCompartment
    function FullCompartment(x::String)
        new(FirstCompartment(x), SecondCompartment(x))
    end
end

struct ThreeRuckSacks <: RuckSack
    first::RuckSack
    second::RuckSack
    third::RuckSack
    function ThreeRuckSacks(x::T, y::T, z::T) where {T<:RuckSack}
        new(x, y, z)
    end
end

ThreeRuckSacks(x::Vector{FullCompartment}) = (length(x) == 3) && ThreeRuckSacks(x[1], x[2], x[3])

findpriority(x::Char) = findfirst(x, join('a':'z') * join('A':'Z'))


function items_on_both(f::FullCompartment)
    uniq_list = unique(f.first.items * f.second.items)
    uniq_item = let
        for u in uniq_list
            findunique = (u in f.first.items) & (u in f.second.items)
            if findunique
                return u
            end
        end
    end
    return uniq_item
end

function find_badges(t::ThreeRuckSacks)
    uniq_list = unique(t.first.first.items * t.first.second.items * t.second.first.items * t.second.second.items * t.third.first.items * t.third.second.items)
    uniq_badge = let
        for u in uniq_list
            findunique = (u in t.first.first.items * t.first.second.items) & (u in t.second.first.items * t.second.second.items) & (u in t.third.first.items * t.third.second.items)
            if findunique
                return u
            end
        end
    end
    return uniq_badge
end

function run()
    # Part 1
    println(sum(findpriority.(items_on_both.(FullCompartment.(readlines(joinpath(@__DIR__, "aoc2022_day3.txt"))[begin:end-1])))))

    # Part 2
    all_rucksacks = FullCompartment.(readlines(joinpath(@__DIR__, "aoc2022_day3.txt"))[begin:end-1])
    total = 0
    for i in 1:3:length(all_rucksacks)
        total += sum(findpriority.(find_badges(ThreeRuckSacks(all_rucksacks[i:3+i-1]))))
    end
    println(total)
end

run()
