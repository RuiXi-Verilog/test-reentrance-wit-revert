const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Greeter", function () {
  it("Should return the new greeting once it's changed", async function () {
    // init
    const Testee = await ethers.getContractFactory("Testee");
    const testee = await Testee.deploy();

    const Tester = await ethers.getContractFactory("Tester");
    const tester = await Tester.deploy(testee.address);

    // reenter
    await tester.attack();

    // audit
    expect(await testee.pre_reentrance_counter()).to.equal("5");
    expect(await testee.post_reentrance_counter()).to.equal("5");
  });
});
