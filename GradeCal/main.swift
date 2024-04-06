class Student {
    var name: String
    var id: String
    var totalGPA: Double
    var courses: [(courseName: String, credit: Int, grade: String)]
    // Constructor
    init(_ name: String, _ id: String) {
        self.name = name
        self.id = id
        self.totalGPA = 0.0
        self.courses = []
    }
    // Getter and Setter for name
    func getName() -> String { return name }
    func setName(name: String) { self.name = name }
    // Getter and Setter for id
    func getId() -> String { return id }
    func setId(id: String) { self.id = id }
    // Getter for courses
    func getCourses() -> [(String, Int, String)] {
        return courses
    }
    // Add a course
    func addCourse(_ courseName: String, _ credit: Int, _ grade: String) {
        courses.append((courseName, credit, grade))
        calculateGPA()
    }
    // Calculate GPA function
    func calculateGPA() {
        var totalPoints: Double = 0.0
        var totalCredits: Int = 0
        var gpa: Double = 0
        for course in courses {
            switch course.grade {
                case "A": gpa = 4.0
                case "B": gpa = 3.0
                case "C": gpa = 2.0
                case "D": gpa = 1.0
                case "F": gpa = 0.0
                default: gpa = 0.0
            }
            totalCredits += course.credit
            totalPoints += gpa * Double(course.credit)
        }
        self.totalGPA = totalCredits > 0 ? totalPoints / Double(totalCredits) : 0
    }
    // Getter for total GPA
    func getGPA() -> Double {
        return totalGPA
    }
    // Print function
    func printData() {
        print("********************************")
        print("Name: \(getName())")
        print("ID: \(getId())")
        var count = 1
        for course in courses {
            print("\n******* \(count) *******", "\nCourse Name:", course.courseName, "\nCredit:", course.credit, "\nGrade:", course.grade)
            count += 1
        }
        print("\nTotal GPA:", getGPA())
    }
}


//Example usage
// Create and print data for student1
var student1 = Student("Dog", "00001")
student1.addCourse("Math", 3, "A")
student1.addCourse("History", 3, "B")
student1.printData()
// Create and print data for student2
var student2 = Student("Cat", "00002")
student2.addCourse("Math", 3, "A")
student2.addCourse("History", 3, "B")
student2.addCourse("Art", 3, "C")
student2.addCourse("Music", 3, "B")
student2.addCourse("CSC", 3, "A")
student2.printData()
// Create and print data for student3
var student3 = Student("Bird", "00003")
student3.addCourse("Math", 3, "A")
student3.addCourse("History", 3, "B")
student3.addCourse("Art", 3, "C")
student3.addCourse("Music", 3, "C")
student3.addCourse("CSC", 3, "B")
student3.addCourse("Accounting", 3, "A")
student3.addCourse("Business", 3, "B")
student3.addCourse("English", 3, "A")
student3.addCourse("Biology", 4, "C")
student3.addCourse("Chemistry", 4, "B")
student3.printData()