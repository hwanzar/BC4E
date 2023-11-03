// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract StudentDB {
    struct Student {
        string name;
        uint256 age;
        string subject;
    }
    mapping(uint => Student) private students;
    uint private studentCount = 0;

    /**
     * @dev Add a new student to the database.
     */
    function addStudent(string memory _name, uint256 _age, string memory _subject) public {
        Student storage newStudent = students[studentCount];
        newStudent.name = _name;
        newStudent.age = _age;
        newStudent.subject = _subject;
        studentCount++;
    }


    function removeStudent(uint _studentId) public {
        require(_studentId < studentCount, "Student does not exist");
        if (_studentId < studentCount - 1) {
            students[_studentId] = students[studentCount - 1];
        }
        delete students[studentCount - 1];
        studentCount--;
    }

    function getStudent(uint _studentId) public view returns (string memory, uint256, string memory) {
        require(_studentId < studentCount, "STUDENT ID UNAVAILABLE");
        Student memory student = students[_studentId];
        return (student.name, student.age, student.subject);
    }


    function clearStudentList() public {
        for (uint i = 0; i < studentCount; i++) {
            delete students[i];
        }
        studentCount = 0;
    }

    /**
     * @dev Update information about a student by their index.
     */
    function updateStudentInformation(uint _studentId, string memory _name, uint256 _age, string memory _subject) public {
        require(_studentId < studentCount, "STUDENT ID UNAVAILABLE");
        Student storage student = students[_studentId];
        student.name = _name;
        student.age = _age;
        student.subject = _subject;
    }
}
