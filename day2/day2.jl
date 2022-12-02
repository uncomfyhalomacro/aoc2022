const rock::Int64 = 1
const paper::Int64 = 2
const scissors::Int64 = 3
const win::Int64 = 6
const draw::Int64 = 3
const lost::Int64 = 0

total = 0

# Part 1
for play in readlines(joinpath(@__DIR__, "aoc2022_day2.txt"))[begin:end-1]
        println(play)
        my_play = split(play)[2]
        enemy_play = split(play)[1]
        my_basepoint = ifelse(my_play == "X", rock, ifelse(my_play == "Y", paper, scissors))
        enemy_basepoint = ifelse(enemy_play == "A", rock, ifelse(enemy_play == "B", paper, scissors))
        theplay = let
            if [enemy_basepoint, my_basepoint] == [1, 2]
                win
            elseif [enemy_basepoint, my_basepoint] == [1, 3]
                lost
            elseif [enemy_basepoint, my_basepoint] == [2, 1]
                lost
            elseif [enemy_basepoint, my_basepoint] == [2, 3]
                win
            elseif [enemy_basepoint, my_basepoint] == [3, 2]
                lost
            elseif [enemy_basepoint, my_basepoint] == [3, 1]
                win
            else
                draw
            end
        end
        global total += theplay + my_basepoint
end

println(total)
total = 0

# Part 2
for play in readlines(joinpath(@__DIR__, "aoc2022_day2.txt"))[begin:end-1]
        println(play)
        my_play = split(play)[2]
        enemy_play = split(play)[1]
        my_basepoint = ifelse(my_play == "X", lost, ifelse(my_play == "Y", draw, win))
        enemy_basepoint = ifelse(enemy_play == "A", rock, ifelse(enemy_play == "B", paper, scissors))
        theplay = let
            if [enemy_basepoint, my_basepoint] == [rock, lost]
                scissors
            elseif [enemy_basepoint, my_basepoint] == [rock, win]
                paper
            elseif [enemy_basepoint, my_basepoint] == [rock, draw]
                rock
            elseif [enemy_basepoint, my_basepoint] == [paper, lost]
                rock
            elseif [enemy_basepoint, my_basepoint] == [paper, win]
                scissors
            elseif [enemy_basepoint, my_basepoint] == [paper, draw]
                paper
            elseif [enemy_basepoint, my_basepoint] == [scissors, lost]
                paper
            elseif [enemy_basepoint, my_basepoint] == [scissors, win]
                rock
            elseif [enemy_basepoint, my_basepoint] == [scissors, draw]
                scissors
            end
        end
        global total += theplay + my_basepoint
end
println(total)