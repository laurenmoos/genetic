include("./lanscape.jl")
using .Hello

import YAML

config = YAML.load_file("test.yml")

curr = initialize()
while curr.t < 1000:
    ranked = fitness_rank(gen)

    #take the top ten percent of individuals by fitness
    top = ranked[:len(gen) * config[top_percent]]

    p = rand(len(x))
    pairs = reshape(top, (2, div(length(top), 2)))
    crossed = [crossover(x, y, p) for (x,y) in pairs]

    mutated = [mutate(x) for x in top]

    next_gen = !append(Gen.pop, crossed, mutated)

    curr = Gen(next_gen, curr.t +=1)
end