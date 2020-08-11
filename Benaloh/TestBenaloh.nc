configuration TestBenaloh{
}

implementation{
        components TestBenalohC, MainC;
        components BenalohC;

        TestBenalohC.Boot->MainC.Boot;
        TestBenalohC.Benaloh->BenalohC;

}


