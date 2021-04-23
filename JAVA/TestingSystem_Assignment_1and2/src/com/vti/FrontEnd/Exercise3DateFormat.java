package com.vti.FrontEnd;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.Date;
import java.util.Locale;

import com.vti.entity.Account;
import com.vti.entity.CategoryQuestion;
import com.vti.entity.Department;
import com.vti.entity.Exam;
import com.vti.entity.Gender;
import com.vti.entity.Group;
import com.vti.entity.Position;
import com.vti.entity.PositionName;
import com.vti.entity.Question;
import com.vti.entity.TypeName;
import com.vti.entity.TypeQuestion;

public class Exercise3DateFormat {
	public static void main(String[] args) {

		Department department1 = new Department();
		department1.id = 1;
		department1.name = "Sale";

		Department department2 = new Department();
		department2.id = 2;
		department2.name = "Marketing";

		Department department3 = new Department();
		department3.id = 3;
		department3.name = "Accounting";

		Department department4 = new Department();
		department4.id = 4;
		department4.name = "ReaserchAndDevelopment";

		Department department5 = new Department();
		department5.id = 5;
		department5.name = "Security";

		// Position
		Position position1 = new Position();
		position1.id = 1;
		position1.name = PositionName.DEV;

		Position position2 = new Position();
		position2.id = 2;
		position2.name = PositionName.PM;

		Position position3 = new Position();
		position3.id = 3;
		position3.name = PositionName.SCRUM_MASTER;

		Position position4 = new Position();
		position4.id = 4;
		position4.name = PositionName.TEST;

//	acc for grouu;

		Account account3 = new Account();
		account3.id = 3;
		account3.email = "mylinh2000@gmail.com";
		account3.userName = "mylinh2000";
		account3.fullName = "DoMyLinh";
		account3.gender = Gender.FEMALE;
		account3.department = department1;
		account3.position = position2;
		account3.createDate = LocalDate.of(2020, 03, 14);

		Account account4 = new Account();
		account4.id = 4;
		account4.email = "bangpham@gmail.com";
		account4.userName = "bangpham";
		account4.fullName = "PhamBangBang";
		account4.gender = Gender.FEMALE;
		account4.department = department5;
		account4.position = position4;
		account4.createDate = LocalDate.of(2020, 03, 14);

		// Group///

		Group group1 = new Group();
		group1.id = 1;
		group1.name = "groupName1";
		group1.creator = account3;
		group1.createDate = LocalDate.of(2020, 03, 14);

		Group group2 = new Group();
		group2.id = 2;
		group2.name = "groupName2";
		group2.creator = account4;
		group2.createDate = LocalDate.of(2020, 03, 14);

		Group group3 = new Group();
		group3.id = 3;
		group3.name = "groupName2";
		group3.creator = account4;
		group3.createDate = LocalDate.of(2020, 03, 14);

		// Account

		Account account1 = new Account();
		account1.id = 1;
		account1.email = "thaonguyentn25598@gmail.com";
		account1.userName = "thaonguyen";
		account1.fullName = "NguyenThiThao";
		account1.gender = Gender.FEMALE;
		account1.department = department1;
		account1.position = position4;
		account1.createDate = LocalDate.of(2020, 03, 14);
		account1.groups = new Group[] { group1, group2 };

		Account account2 = new Account();
		account2.id = 2;
		account2.email = "hochiminh@gmail.com";
		account2.userName = "hochiminh";
		account2.fullName = "HoChiMinh";
		account2.gender = Gender.MALE;
		account2.department = department2;
		account2.position = position2;
		account2.createDate = LocalDate.of(2020, 03, 14);
		account2.groups = new Group[] { group1, group2 };

		Account account5 = new Account();
		account5.id = 5;
		account5.email = "hochiminh@gmail.com";
		account5.userName = "nguyentuan93";
		account5.fullName = "NguyenNgocTuan";
		account5.gender = Gender.MALE;
		account5.department = department1;
		account5.position = position3;
		account5.createDate = LocalDate.of(2020, 03, 14);

		Account account6 = new Account();
		account6.id = 6;
		account6.email = "nhatvuong@gmail.com";
		account6.userName = "nhatvuong";
		account6.fullName = "PhamNhatVuong";
		account6.gender = Gender.MALE;
		account6.department = department1;
		account6.position = position2;
		account6.createDate = LocalDate.of(2020, 03, 14);
		account6.groups = new Group[] { group1, group2 };

		Account account7 = new Account();
		account7.id = 7;
		account7.email = "huongnguyen@gmail.com";
		account7.userName = "huongnguyen";
		account7.fullName = "NguyenThiHuong";
		account7.gender = Gender.FEMALE;
		account7.department = department3;
		account7.position = position2;
		account7.createDate = LocalDate.of(2020, 03, 14);
		account7.groups = new Group[] { group1, group2 };

		// TypeQuestion

		TypeQuestion type1 = new TypeQuestion();
		type1.id = 1;
		type1.name = TypeName.ESSAY;

		TypeQuestion type2 = new TypeQuestion();
		type2.id = 2;
		type2.name = TypeName.MULTIPLE_CHOICE;

		// CategoryQuestion

		CategoryQuestion categoryquestion1 = new CategoryQuestion();
		categoryquestion1.id = 1;
		categoryquestion1.name = "Java";

		CategoryQuestion categoryquestion2 = new CategoryQuestion();
		categoryquestion2.id = 2;
		categoryquestion2.name = "SQL";

		CategoryQuestion categoryquestion3 = new CategoryQuestion();
		categoryquestion3.id = 3;
		categoryquestion3.name = "Postman";

		CategoryQuestion categoryquestion4 = new CategoryQuestion();
		categoryquestion4.id = 4;
		categoryquestion4.name = ".NET";

		CategoryQuestion categoryquestion5 = new CategoryQuestion();
		categoryquestion5.id = 5;
		categoryquestion5.name = "Ruby";

		System.out.println();
		// create Exam

		Exam exam1 = new Exam();
		exam1.examID = 1;
		exam1.code = 10;
		exam1.title = "MônThiSQL";
		exam1.category = categoryquestion1;
		exam1.duration = 15;
		exam1.creator = account1;
		exam1.createDate = LocalDate.of(2020, 03, 16);

		Exam exam2 = new Exam();
		exam2.examID = 2;
		exam2.code = 11;
		exam2.title = "MônThiRuby";
		exam2.category = categoryquestion5;
		exam2.duration = 30;
		exam2.creator = account3;
		exam2.createDate = LocalDate.of(2020, 03, 16);

		Exam exam3 = new Exam();
		exam3.examID = 3;
		exam3.code = 12;
		exam3.title = "MônThiPostman";
		exam3.category = categoryquestion3;
		exam3.duration = 15;
		exam3.creator = account3;
		exam3.createDate = LocalDate.of(2020, 03, 16);

		Exam exam4 = new Exam();
		exam4.examID = 1;
		exam4.code = 13;
		exam4.title = "MônThiJava";
		exam4.category = categoryquestion1;
		exam4.duration = 15;
		exam4.creator = account4;
		exam4.createDate = LocalDate.of(2020, 03, 16);

		// Question

		Question question1 = new Question();
		question1.quesid = 1;
		question1.content = "JavaLaGi";
		question1.category = categoryquestion3;
		question1.type = type1;
		question1.creator = group1;
		question1.createDate = LocalDate.of(2020, 03, 16);
		question1.exams = new Exam[] { exam1, exam2, exam3, exam4 };

		Question question2 = new Question();
		question2.quesid = 2;
		question2.content = "PostmanLaGi";
		question2.category = categoryquestion3;
		question2.type = type2;
		question2.creator = group2;
		question2.createDate = LocalDate.of(2020, 03, 16);
		question2.exams = new Exam[] { exam1, exam2, exam3, exam4 };

		Question question3 = new Question();
		question3.quesid = 3;
		question3.content = ".NETLaGi";
		question3.category = categoryquestion4;
		question3.type = type2;
		question3.creator = group3;
		question3.createDate = LocalDate.of(2020, 03, 16);
		question3.exams = new Exam[] { exam1, exam2, exam3, exam4 };

		Question question4 = new Question();
		question4.quesid = 2;
		question4.content = "PostmanLaGi";
		question4.category = categoryquestion3;
		question4.type = type2;
		question4.creator = group2;
		question4.createDate = LocalDate.of(2020, 03, 16);
		question4.exams = new Exam[] { exam1, exam2, exam3, exam4 };

		Question question5 = new Question();
		question5.quesid = 5;
		question5.content = "PostmanLaGi";
		question5.category = categoryquestion2;
		question5.type = type1;
		question5.creator = group1;
		question5.createDate = LocalDate.of(2020, 03, 16);
		question5.exams = new Exam[] { exam1, exam2, exam3, exam4 };

		Question question6 = new Question();
		question6.quesid = 6;
		question6.content = "RubyLaGi";
		question6.category = categoryquestion5;
		question6.type = type2;
		question6.creator = group2;
		question6.createDate = LocalDate.of(2020, 03, 16);
		question6.exams = new Exam[] { exam1, exam2, exam3, exam4 };

		// Exam

		Exam exam5 = new Exam();
		exam5.examID = 5;
		exam5.code = 14;
		exam5.title = "MônThiJava";
		exam5.category = categoryquestion1;
		exam5.duration = 15;
		exam5.creator = account2;
		exam5.createDate = LocalDate.of(2020, 03, 16);
		exam5.questions = new Question[] { question1, question2, question3, question4, question5, question6 };

		Exam exam = new Exam();
		exam.examID = 5;
		exam.code = 15;
		exam.title = "MônThiSQL";
		exam.category = categoryquestion4;
		exam.duration = 15;
		exam.creator = account5;
		exam.createDate = LocalDate.of(2020, 03, 16);
		exam.questions = new Question[] { question1, question2, question3, question4, question5, question6 };
		
//	Question 1: In ra thông tin Exam thứ 1 và property create date sẽ được format theo định dạng vietnamese
		
		ZoneId systemTimeZone = ZoneId.systemDefault();
		ZonedDateTime zonedDateTime = exam1.createDate.atStartOfDay(systemTimeZone);
		Date createDateOfExam1 = Date.from(zonedDateTime.toInstant());
		
		Locale locale = new Locale("vi", "VN");

		DateFormat dateformat = DateFormat.getDateInstance(DateFormat.DEFAULT, locale);
		String date = dateformat.format(createDateOfExam1);
		System.out.println(date);
		System.out.println("\n");
		
//		Question 4: Chỉ in ra tháng và năm của create date property trong Question 2
//		Question 5: Chỉ in ra "MM-DD" của create date trong Question 2	


		Locale locale1 = new Locale("vi", "VN");
		DateFormat dateformat1 = DateFormat.getDateInstance(DateFormat.DEFAULT,
		locale1);
		String date1 = dateformat1.format(createDateOfExam1);
		System.out.println(exam1.code + ": " + date1);
		
		
		System.out.println(account2.createDate);
		String pattern1 = "yyyy-MM-dd-HH-mm-ss";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern1);
		String date2 = simpleDateFormat.format(new Date());
		System.out.println(date2);
		System.out.println("\n");
		
//		Question 2: In ra thông tin: Exam đã tạo ngày nào theo định dạng Năm – tháng – ngày – giờ – phút – giây
		
		
		System.out.println(account2.createDate);
		String pattern = "yyyy-MM-dd-HH-mm-ss";
		SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat(pattern);
		
		Exam[] exams = { exam1, exam2 };
		for (Exam exam41 : exams) {
		date = simpleDateFormat.format(exam41.createDate);
		
		System.out.println(exam41.code + ": " + date);
		System.out.println("\n");
		
//		Question 3: Chỉ in ra năm của create date property trong Question 24
		
		
	}
}
