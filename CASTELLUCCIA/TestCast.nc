configuration TestCast{
}

implementation{
        components TestCastC, MainC;
        components CastC;

        TestCastC.Boot->MainC.Boot;
        TestCastC.Castelluccia->CastC;
}



