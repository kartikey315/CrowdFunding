const { inputToConfig } = require("@ethereum-waffle/compiler");
const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Lottery Contract", function (){

    let Lottery;
    let lottery;
    let manager;
    let participant;
    let eth;

    beforeEach(async function(){

        Lottery = await ethers.getContractFactory("Lotter");
        [manager,participant] = await ethers.getSigners();
        lottery = await Lottery.deploy();

    });

    describe("Deployment", function(){


        it("Should set the rigth owner",async function(){

            expect(await lottery.manager()).to.equal(manager.address);

        });
    });

    describe("Ticket purchasing", function(){

        it("receiving payment",async function(){

            const oldbalance = await lottery.getBalance();
            const transactionHash = await participant.sendTransaction({
                to: manager.address,
                value: ethers.utils.parseEther("1"), // Sends exactly 1.0 ether
              });
              expect(await)
            
        });

    });

    describe("Inner Contract functions", function(){

        it("Random number check",async function(){

            const oldrand = await lottery.random();
            const newrand = await lottery.random();
            const rand = await lottery.random();
            expect(rand).to.not.equal(oldrand);

        });
    })

});