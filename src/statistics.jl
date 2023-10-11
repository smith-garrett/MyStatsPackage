"""
    rse_sum(x)

Return the sum of the elements in x.
"""
function rse_sum(x)
    sm = zero(eltype(x))
    for i in eachindex(x)
        sm += x[i]
    end
    return sm
end

rse_sum(1:36) == 666

"""
    rse_mean(x)

Return the mean of the elements in x.
"""
function rse_mean(x)
    sm = rse_sum(x)
    return sm / length(x)
end

rse_mean(-15:17) == 1

"""
    rse_std(x)

Return the standard deviation of the elements in x.
"""
function rse_std(x)
    ln = length(x)
    return sqrt(sum((x .- rse_mean(x)) .^ 2) / (ln - 1))
end

rse_std(1:3) == 1

"""
    rse_tstat(x; σ = rse_std(x))

Return the t-statistic for the comparison of the elements of x to an assumed mean of 0. The 
optional σ parameter can be used to provide a known standard deviation, otherwise it is 
calculated from the data.
"""
function rse_tstat(x; σ = rse_std(x))
    mn = rse_mean(x)
    #=
    if σ == nothing
        σ = rse_std(x)
    end
    =#
    ln = length(x)
    return mn / (σ / sqrt(ln))
end

"""
    StatResult(x, n, std, tvalue)

A type for storing t-statistics from data.
"""
struct StatResult
    x::Vector
    n::Int64
    std::Float64
    tvalue::Float64
end

"""
    StatResult(data)

Create an instance of StatResult, calculating the statistics from the argument data.
"""
StatResult(data) = StatResult(collect(data), length(data), rse_std(data), rse_tstat(data))
