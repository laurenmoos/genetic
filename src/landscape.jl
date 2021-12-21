struct Ind <: Array{Bool, 10}

mutable struct Gen
    t::Int
    pop :: List[Ind]
end

module Landscape

    function crossover(x::Ind, y::Ind, p::Int)
    c_1 = Ind(append!(y.g[:p] , x.g[p:len(x.g)]))
    c_2 = Ind(append!(x.g[:p] , y.g[p:len(y.g)]))
    [c_1, c_2]

    end
    #TODO: implement error and evaluate, can just be dummy values
    fitness(i::Ind) = error(evaluate(i))

    initialize(n::Int) = Generation(0, sample_creatures(n))

    random_creature() = rand(Bit, 10)

    sample_creatures(n::Int) = [random_creature() for _ in range(n)]

    mutate(x::Creature) = map((x) -> if (rand(100) == 1) x^1 else x end, gp)

end