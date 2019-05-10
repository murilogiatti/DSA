pragma solidity ^0.5.0;

contract Leilao {
  enum State { Andamento, Falha, Sucesso, Pago }

  string public name;
  uint public targetAmount;
  uint public deadline;
  address payable public beneficiario;
  State public estado;

  constructor(
    string memory contractName,
    uint targetAmountEth,
    uint durationInMin,
    address payable beneficiaryAddress    
    )

  public {
    name = contractName;
    targetAmount = etherToWei(targetAmountEth);
    deadline = currentTime() + minutesToSeconds(durationInMin);
    beneficiario = beneficiaryAddress;
    estado = State.Andamento;
  }

  function etherToWei(uint sumInEth) public pure returns(uint) {
    return sumInEth * 1 ether;
  }

  function minutesToSeconds(uint timeInMin) public pure returns(uint) {
    return timeInMin * 1 minutes;
  }
}