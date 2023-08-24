//SPDX-License-Identifier:MIT
pragma solidity ^0.8.8;  
//@import the file that contains the child contract  
import "./studentDetails.sol";

contract StudentDetailsFactory{        
           
function createStudentDetails() external returns(StudentDetails stud){
     stud = new StudentDetails(msg.sender);
     //return stud; //instead of putting return stud here, i can just pass it directly to the returns parameter, after the datatype
}

}