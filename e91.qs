// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT license.

//////////////////////////////////////////////////////////////////////
// This file contains reference solutions to all tasks.
// The tasks themselves can be found in Tasks.qs file.
// We recommend that you try to solve the tasks yourself first,
// but feel free to look up the solution if you get stuck.
//////////////////////////////////////////////////////////////////////


// coin flip on single coin
namespace Quantum.Kata.GHZGame {

    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Math;
    
    
    // Task 2.1. parpare the Entangled pair (Bell state);
    operation CreateEntangledPair (qs : Qubit[]) : Unit is Adj {

        H(qs[0]);
        CNOT(qs[0],qs[1]);
    }
    //Generate random array
    operation BuildRandomArray(N : Int) : Bool[] {
        mutable array = new Bool[N];

        for (i in 0 .. N - 1) {
            set array w/= i <- RandomInt(2) == 1;
        }
        return array;
    }
    // measure the qubit in the random base
    operation MeasureQubit (qs : Qubit, bases : Bool) : Bool {
        if (bases == true) {
            H(qs);
        }
        return M(qs) == One;
    }
    
    operation E91_protocol() : Unit{
        let n = 5;
        let AliceArray = BuildRandomArray(n);
        let BobArray = BuildRandomArray(n);
        Message($"AliceArray  == {AliceArray}");
        Message($"BobArray  == {BobArray}");
        // let AliceArray =[true,false,true,false,true];
        // let BobArray = [true,false,true,false,true];
        mutable key = new Bool[0];
        for(i in 0..n-1){
            using(qs = Qubit[2]){
                CreateEntangledPair(qs);
                if(AliceArray[i] == BobArray[i]){
                    let resultA = MeasureQubit(qs[0],AliceArray[i]);
                    let resultB = MeasureQubit(qs[1],AliceArray[i]);
                    Message($"{i}  A == {resultA}  B = {resultB}");
                    set key+= [resultA];
                }
                ResetAll(qs);
            }
        }
        Message($"raw key == {key}");
    }

    operation eave() : Unit{

        let n = 20;
        let AliceArray = BuildRandomArray(n);
        let BobArray = BuildRandomArray(n);
        let EaveArray = BuildRandomArray(n);
        Message($"AliceArray  == {AliceArray}");
        Message($"BobArray  == {BobArray}");
        Message($"EaveArray == {EaveArray}");
        // let AliceArray =[true,false,true,false,true];
        // let BobArray = [true,false,true,false,true];
        mutable key = new Bool[0];
        for(i in 0..n-1){
            using(qs = Qubit[2]){
                CreateEntangledPair(qs);
                if(AliceArray[i] == BobArray[i]){
                    let resultA = MeasureQubit(qs[0],AliceArray[i]);
                    let a = MeasureQubit(qs[1],EaveArray[i]);
                    let resultB = MeasureQubit(qs[1],AliceArray[i]);
                    Message($"{i}  A == {resultA}  B = {resultB}");
                    set key+= [resultA];
                }
                // when A base != B base
                else{
                    let resultA = MeasureQubit(qs[0],AliceArray[i]);
                    let a = MeasureQubit(qs[1],EaveArray[i]);
                    // Eave still the qubit, measure the qubit in random base, and send a new qubit to Bob
                    using(newq = Qubit()){
                        if(a== true){
                            X(newq);
                        }
                        if(EaveArray[i] == true){
                            H(newq);
                        }
                        let resultB = MeasureQubit(newq,AliceArray[i]);
                        if(resultA!= resultB){
                            Message("Eavesdropper");
                        }
                        Reset(newq);
                    }
                }
                ResetAll(qs);
            }
        }
        Message($"{key}");
    }
}

