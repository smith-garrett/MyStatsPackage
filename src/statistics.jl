using ProgressMeter

function rse_sum(x)
    sm = zero(eltype(x))
    @showprogress dt=0.1 for i in eachindex(x)
        sm += x[i]
    end
    return sm
end

rse_sum(1:36) == 666

function rse_mean(x)
    sm = rse_sum(x)
    return sm / length(x)
end

rse_mean(-15:17) == 1

function rse_std(x)
    ln = length(x)
    return sqrt(sum((x .- rse_mean(x)).^2) / (ln-1))
end

rse_std(1:3) == 1

#function rse_tstat(x; σ=nothing)
function rse_tstat(x; σ=rse_std(x))
    mn = rse_mean(x)
    #=
    if σ == nothing
        σ = rse_std(x)
    end
    =#
    ln = length(x)
    return mn / (σ / sqrt(ln))
end

rse_tstat(2:3) == 5

rse_tstat(rand(10_000))

# Task 2:

struct StatResult
    x
    n
    std
    tvalue
end

StatResult(data) = StatResult(collect(data), length(data), rse_std(data), rse_tstat(data))
r = StatResult(2:10)