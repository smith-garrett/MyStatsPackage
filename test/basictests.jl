@testset "Unit tests" begin
    @testset "Summing" begin
        @test rse_sum(1:36) == 666
    end
    

    @testset "Means" begin
        @test rse_mean(1:4) == 2.5
        @test rse_mean(-15:17) == 1
    end
    

    @testset "Standard deviation" begin
        @test rse_std(1:3) == 1
    end
    
    
    @testset "t-statistic" begin
        @test rse_tstat(2:3) == 5
    end
end

@testset "Integration tests" begin
    data = -15:17
    mn = rse_mean(data)
    std = rse_std(data)
    @test mn / (std / sqrt(length(data))) == rse_tstat(data)
end
