# Lorenz2.jl
# Illustrates the Lorenz attractor with noise 

# Edit History:
# 1/13/2024 Original version

using Pkg
Pkg.add("DifferentialEquations")
Pkg.add("Plots")
using DifferentialEquations
using Plots

function lorenz(du, u, p, t)
    du[1] = 10.0(u[2] - u[1])
    du[2] = u[1] * (28.0 - u[3]) - u[2]
    du[3] = u[1] * u[2] - (8 / 3) * u[3]
end

function σ_lorenz(du, u, p, t)
    du[1] = 3.0
    du[2] = 3.0
    du[3] = 3.0
end

u0 = [1.0, 0.0, 0.0]              # Initial conditions
tspan = (0.0, 100.0)              # Timespan of the simulation 
W = WienerProcess(0.0, 0.0, 0.0)  # Standard Wiener Process

# Lorenz solution with noise using the SDE solver
prob2 = SDEProblem(lorenz, σ_lorenz, u0, tspan)
sol2 = solve(prob2)
plot2 = plot(sol2, idxs = (1, 2, 3), xlabel="x", ylabel="y", zlabel="z", label="x against y against z")
savefig("Lorenz2")