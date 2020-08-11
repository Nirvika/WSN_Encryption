configuration TestPailier{
}

implementation{
        components TestPailierC, MainC;
        components PailierC;

        TestPailierC.Boot->MainC.Boot;
        TestPailierC.Pailier->PailierC;

}

