File {
    Grid    = "@tdr@"
    Plot    = "finfet_des.tdr"
    Current = "finfet_des.plt"
    Output  = "finfet_des.log"
}

Electrode {
    { Name="source" Voltage=0.0 }
    { Name="drain"  Voltage=0.0 }
    { Name="gate"   Voltage=0.0 }
}

Physics {

    Fermi

    EffectiveIntrinsicDensity(OldSlotboom)

    Mobility(
        DopingDep
        Enormal(IALMob)
        HighFieldSaturation
    )

    Recombination(
        SRH(DopingDep)
        Auger
    )
}

Plot {
    BandGap
    eDensity hDensity
    Potential
    ElectricField/Vector
    eCurrent/Vector
    hCurrent/Vector
    TotalCurrent/Vector
    Doping
    eMobility hMobility
    ConductionBandEnergy
    ValenceBandEnergy
}

Math {
    Extrapolate
    Derivatives
    RelErrControl
    Digits=5
    Iterations=20
    Method=ILS
    -CheckUndefinedModels
}

Solve {

    Coupled {
        Poisson Electron Hole
    }

    Quasistationary(
        InitialStep=1e-3
        Increment=1.5
        MinStep=1e-5
        MaxStep=0.05
        Goal { Name="drain" Voltage=0.8 }
    ) {
        Coupled {
            Poisson Electron Hole
        }
    }

    Quasistationary(
        InitialStep=1e-3
        Increment=1.5
        MinStep=1e-5
        MaxStep=0.05
        Goal { Name="gate" Voltage=1.0 }
    ) {
        Coupled {
            Poisson Electron Hole
        }
    }
}
