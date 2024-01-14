# Lorenz1.jl
# Illustrates the classical Lorenz attractor 

# Edit History:
# 1/13/2024 Original version

using Pkg
Pkg.add("DifferentialEquations")
Pkg.add("Plots")
using DifferentialEquations
using Plots

function parameterized_lorenz!(du,u,p,t)    
    x, y, z = u               # variables are part of vector array u 
    σ, ρ, β, = p              # coefficients are part of vector array p
    du[1] = dx = σ*(y-x)
    du[2] = dy = x*(ρ-z) - y
    du[3] = dz = x*y - β*z
end

u0 = [1.0, 0.0, 0.0]   # Initial conditions
tspan = (0.0, 100.0)   # Timespan of the simulation 
p = [10.0, 28.0, 8/3]  # Coefficients of the functions

# classical Lorenz solution using the ODE solver
prob1 = ODEProblem(parameterized_lorenz!, u0, tspan, p)  
sol1 = solve(prob1)
plot1 = plot(sol1, idxs = (1,2,3), xlabel="x", ylabel="y", zlabel="z", label="x against y against z")
savefig("Lorenz1")