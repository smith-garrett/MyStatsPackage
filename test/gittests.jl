@testset "Git exercises" begin
    # These tests are dumb
    @test_warn "smith-garrett" @warn redirect_stdout(printOwner, stderr)
    @test_warn "Contribution from Dmitry Kabanov" @warn redirect_stdout(
        printContributor,
        stderr,
    )
end
