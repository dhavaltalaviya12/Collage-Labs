-- Create the Customers table
CREATE TABLE Customers (
 Customer_id INT PRIMARY KEY,
 Customer_Name VARCHAR(250) NOT NULL,
 Email VARCHAR(50) UNIQUE
);

-- Create the Orders table
CREATE TABLE Orders (
 Order_id INT PRIMARY KEY,
 Customer_id INT,
 Order_date DATE NOT NULL,
 FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id)
);

insert into Customers values(101,'Dhaval','dm@gmail.com')

--Lab - 7 :-

--Part – A :-

--1. Handle Divide by Zero Error and Print message like: Error occurs that is - Divide by zero error.
	begin try
		declare @n1 int = 10, @n2 int = 0, @ans int
		set @ans = @n1 / @n2
	end try

	begin catch
		print 'Error occurs that is - Divide by zero error.'
	end catch

--2. Try to convert string to integer and handle the error using try…catch block.
	begin try
		declare @name int
		set @name = 'Dhaval'
		print @name
	end try

	begin catch
		print error_message()
	end catch

--3. Create a procedure that prints the sum of two numbers: take both numbers as integer & handle
--exception with all error functions if any one enters string value in numbers otherwise print result.
	create or alter procedure pr_exception_handle_sum_string_int
	@num1 varchar(50),
	@num2 varchar(50)
	as begin
		begin try
			declare @sum int
			declare @intnum1 int = cast(@num1 as int),  @intnum2 int = cast(@num2 as int)
			set @sum = @intnum1 + @intnum2 
			print @sum
		end try

		begin catch
			print error_message()
		end catch
	end

	exec pr_exception_handle_sum_string_int '10','20'
			

--4. Handle a Primary Key Violation while inserting data into customers table and print the error details
--such as the error message, error number, severity, and state.
	begin try
		insert into Customers values(101,'Dhaval','dm@gmail.com')
	end try

	begin catch
		print error_message()
		print error_number()
		print error_severity()
		print error_state()
	end catch
	
	
--5. Throw custom exception using stored procedure which accepts Customer_id as input & that throws
--Error like no Customer_id is available in database.
	create or alter procedure pr_custom_exception
	@id int
	as begin
		if not exists (select 1 from Customers where Customer_id = @id)
		begin 
			throw 55555,'No Customer_id is available in database',1;
		end
		else
		begin 
			print 'Customer ID exists'
		end
	end

	exec pr_custom_exception 110


--Part – B :-

--6. Handle a Foreign Key Violation while inserting data into Orders table and print appropriate error
--message.
	begin try
		insert into Orders values(101,334,'2025-02-13')
	end try

	begin catch
		print error_message()
	end catch

--7. Throw custom exception that throws error if the data is invalid.
	create or alter procedure pr_invalid
	@number int
	as begin
		if @number > 0
		begin
			print 'number is valid'
		end
		else
		begin
			throw 66666, 'number greater than zero', 1
		end
	end

	exec pr_invalid -100

--8. Create a Procedure to Update Customer’s Email with Error Handling
	create or alter procedure pr_update_email
	@id int,@email varchar(50)
	as begin
		if exists (select 1 from Customers where Customer_id = @id)
			begin
				update Customers set Email = @email where Customer_id = @id
			end
		else
			begin
				throw 77777, 'please enter valid ID',1
			end 
	end

	exec pr_update_email 103,'dhvl@gmail.com'
