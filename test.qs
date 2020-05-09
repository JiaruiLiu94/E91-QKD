// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT license.

//////////////////////////////////////////////////////////////////////
// This file contains testing harness for all tasks.
// You should not modify anything in this file.
// The tasks themselves can be found in Tasks.qs file.
//////////////////////////////////////////////////////////////////////

namespace Quantum.Kata.GHZGame {

    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Diagnostics;

    // function RefereeBits () : Bool[][] {
    //     return [[false, false, false],
    //             [true, true, false],
    //             [false, true, true],
    //             [true, false, true]];
    // }

    // function RefereeBits2 () : Bool[][] {
    //     return [[ false, false],
    //             [ true, false],
    //             [false, true],
    //             [true, true]];
    // }
    // function RefereeBits3 () : Bool[] {
    //     return [ true, false];       
    // }


    
    // // Test using Quantum random strategy
    // operation T1_Test() : Unit {
    //     // Allocate a qubit which you'll pass to the operation
    //     mutable success= 0;
    //     for(i in 1..1000){ 
    //             let rst = (RefereeBits())[RandomInt(Length(RefereeBits()))];

    //             let strategies = [QuantumStrategy_Reference(rst[0], _), 
    //                             QuantumStrategy_Reference(rst[1], _), 
    //                             QuantumStrategy_Reference(rst[2], _)];

    //             let abc = PlayQuantumGHZ_Reference(strategies);
    //             if(WinCondition_Reference(rst,abc)) {
    //                 set success+=1;
    //             }
    //             //Message($"original={rst}   answer={abc}");
    //         }
    //        Message($"The successs time in GHZ game using Quantum strategy is {success}");
    //     }

    //     // Test using classic random strategy
    //     operation T2_Test() : Unit {
    //         mutable success = 0;
    //         for(i in 1..1000){
    //             let rst = (RefereeBits())[RandomInt(Length(RefereeBits()))];
    //             let abc = [RandomClassicalStrategy_Reference(rst[0]),
    //             RandomClassicalStrategy_Reference(rst[1]),
    //             RandomClassicalStrategy_Reference(rst[2])];
    //             if(WinCondition_Reference(rst,abc)) {
    //                 set success+=1;
    //             }
    //         }
    //          Message($"The successs time in GHZ game using Classic strategy is {success}");
    //     }

    //     operation T4_Test () : Unit {
    //        mutable success = 0;
    //        for(i in 1..1000){
    //            using(q =Qubit()){
    //                ComputerPly(q);
    //                peoplePlay(q);
    //                ComputerPly(q);
    //                if(M(q) == Zero){
    //                    set success+=1;
    //                }
    //                Reset(q);
    //            }
    //        }
    //         //Message($"Computer wins Single coin flip {success} times ");
    //     }

    //     operation T5_Test() : Unit {
    //     // Allocate a qubit which you'll pass to the operation
    //         mutable success= 0;
    //         for(i in 1..1000){ 
    //             let arr = (RefereeBits2())[RandomInt(Length(RefereeBits()))];
    //             let r = arr[0];
    //             let s = arr[1];
    //             let (a,b) = PlayQuantumCHSH(r,s);
    //             if(WinCondition_CHSH(r,s,a,b)) {
    //                 set success+=1;
    //             }
    //                 //Message($"original={rst}   answer={abc}");
    //         }
    //            Message($"The successs time using Quantum strategy in CHSH game is {success}");
    //     }

    //     operation T6_Test() : Unit {
    //     // Allocate a qubit which you'll pass to the operation
    //         // Test on flip Two Coins
    //         let k = 2;
    //         for(i in 1..10){
    //             using(qs = Qubit[k]){
    //                 //DumpMachine("/Users/jr/task0.txt");
    //                 ComputerPly_Kcoins(qs);
    //                 //DumpMachine("/Users/jr/task1.txt");
    //                 mutable pattern = new Bool[k];
    //                 mutable countFlip = 0;
    //                 for(j in 0..k-1){
    //                     let b = RandomInt(2)==1?true|false;
    //                     set pattern w/= j<-b;
    //                     if(b){
    //                         set countFlip+=1;
    //                     }
    //                 }
    //                 mutable str = (countFlip%2==0?"Even"|"Odd");
    //                 peoplePlay_Kc0ins(qs,pattern);
    //                 //DumpMachine("/Users/jr/task2.txt");
    //                 ComputerAnswer(qs);
    //                 //DumpMachine("/Users/jr/task3.txt");
    //                 mutable answer = new Bool[k];
    //                 for(j in 0..k-1){
    //                     set answer w/= j<-(M(qs[j])==Zero?true|false);
    //                 }
    //                 Message($"pattern ={pattern}   num = {str}     answer={answer}");
    //                 ResetAll(qs);
    //             }
    //         }

    //         //Message($"The successs time using Quantum strategy in CHSH game is {success}");
    //     }


    operation T1_Test() : Unit {
        // Allocate a qubit which you'll pass to the operation
        E91_protocol();
        eave();
    }


}