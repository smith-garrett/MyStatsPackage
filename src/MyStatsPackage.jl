module MyStatsPackage

include("statistics.jl")
export rse_sum, rse_mean, rse_std, rse_tstat

include("git_exercise.jl")
export printOwner

end # module MyStatsPackage
