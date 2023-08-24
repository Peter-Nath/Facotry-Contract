//SPDX-License-Identifier:MIT
pragma solidity ^0.8.8;

//write a contract for handling student details of a specific student can be updated or deleted by an admin only;
//anyone can query the details of each student.  
contract StudentDetails {

    struct Student {
        string name;
        string class;
        uint age; 
    }
    address public admin; 
    address[] register; 

    mapping(address => Student) public student;

    constructor( address _addr)  { //takes the parameter and 
    admin = _addr;
    }

    modifier onlyAdmin() {
    (admin == msg.sender, "Only an admin can carry out this functionality");
    _;  
    }

    function RegisterStudent( address _addr, string memory _name, string memory _class, uint _age ) public onlyAdmin{
     student[_addr] = Student({name: _name, class:_class, age: _age});
     register.push(_addr);
    }

    function deleteStud(address _add) public onlyAdmin{
    delete student[_add];
    }

    function UpdateName(address _addr, string memory _name) public onlyAdmin {
     Student storage stud = student[_addr];
     stud.name = _name;
    } 

    function UpdateClass(address _addr, string memory _class) public onlyAdmin{
     Student storage stud = student[_addr];
     stud.class = _class;
    }

    function UpdateAge(address _addr, uint _age) public onlyAdmin{
     Student storage stud = student[_addr];
     stud.age = _age;
    }

    function allStudent() public view returns(address[] memory) {
    return register;
    }
//0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2 -- nath
//0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db -- jees
//0x617F2E2fD72FD9D5503197092aC168c91465E7f2 -- dele
//0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C -- john
//0x583031D1113aD414F02576BD6afaBfb302140225 -- rebecca
//0x1aE0EA34a72D944a8C7603FfB3eC30a6669E454C -- tosin
//0x17F6AD8Ef982297579C203069C1DbfFE4348c372 -- Adeola

}