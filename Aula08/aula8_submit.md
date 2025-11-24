# BD: Guião 8


## ​8.1
 
### *a)*

```
CREATE PROCEDURE remover_funcionario 
  @ssn char(9)
AS
BEGIN
  -- Obter o ID do funcionário a ser removido
  DECLARE @v_id char(9);
  SELECT @v_id = Ssn FROM Employee WHERE Ssn = @ssn;
   
  -- Remover entradas na tabela works_on
  DELETE FROM Works_on WHERE Essn = @v_id;
  
  -- Remover dependentes
  DELETE FROM Dependent WHERE Essn = @v_id;
  
  -- Remover funcionário
  DELETE FROM Employee WHERE Ssn = @v_id;

  UPDATE Employee set Super_ssn = NULL where Super_ssn = @ssn;
  
END;

As preocupações adicionais:
- Garantir que tudo é feito numa transação;
- Confirmar que o funcionário existe antes de o apagar;
- Garantir que só os utilizador que têm permissões, é que podem aceder e modificar o Stored Procedure;
- Tratamento de erros.
```

### *b)* 

```
... Write here your answer ...
```

### *c)* 

```
CREATE TRIGGER salary ON Company.DEPARTMENT
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT Mgr_ssn
        FROM Department
        WHERE Mgr_ssn IN (
            SELECT Mgr_ssn
            FROM inserted
        )
        GROUP BY Mgr_ssn
        HAVING COUNT(*) > 1
    )
    BEGIN
        RAISERROR ('O funcionário já é gestor de outro departamento.', 16, 1);
        ROLLBACK TRANSACTION
        RETURN
    END
END

```

### *d)* 

```
... Write here your answer ...
```

### *e)* 

```
CREATE FUNCTION emplsprojects
(
    @ssn VARCHAR(9)
)
RETURNS TABLE
AS
RETURN
(
    SELECT p.Pname, p.Plocation
    FROM Company.Project p
    INNER JOIN Company.Works_on w ON p.Pnumber = w.Pno
    INNER JOIN Company.Employee e ON w.Essn = e.Ssn
    WHERE e.Ssn = @ssn
);

GO
SELECT * FROM employeeProjects('183623612');
```

### *f)* 

```
... Write here your answer ...
```

### *g)* 

```
GO
CREATE FUNCTION company.employeeDeptHighAverage (@Dno INT)
RETURNS @ProjectInfo TABLE
(
    Pname VARCHAR(30),
    Pnumber INT,
    Plocation VARCHAR(20),
    Dnum INT,
    Budget DECIMAL(10,2),
    TotalBudget DECIMAL(10,2)
)
AS
BEGIN
    DECLARE
        @Pname VARCHAR(30),
        @Pnumber INT,
        @Plocation VARCHAR(20),
        @Dnum INT,
        @Budget DECIMAL(10,2),
        @TotalBudget DECIMAL(10,2) = 0,
        @EmployeeSalary DECIMAL(10,2);

    DECLARE project_cursor CURSOR FOR
        SELECT p.Pname, p.Pnumber, p.Plocation, p.Dnum, e.Salary
        FROM Company.Project p
        JOIN Company.Works_on w ON p.Pnumber = w.Pno
        JOIN Company.Employee e ON w.Essn = e.Ssn
        WHERE p.Dnum = @Dno;

    OPEN project_cursor;

    FETCH NEXT FROM project_cursor
        INTO @Pname, @Pnumber, @Plocation, @Dnum, @EmployeeSalary;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @Budget = @EmployeeSalary / 40;
        SET @TotalBudget = @TotalBudget + @Budget;

        INSERT INTO @ProjectInfo (Pname, Pnumber, Plocation, Dnum, Budget, TotalBudget)
        VALUES (@Pname, @Pnumber, @Plocation, @Dnum, @Budget, @TotalBudget);

        FETCH NEXT FROM project_cursor
            INTO @Pname, @Pnumber, @Plocation, @Dnum, @EmployeeSalary;
    END;

    CLOSE project_cursor;
    DEALLOCATE project_cursor;

    RETURN;
END;
GO

SELECT * FROM company.employeeDeptHighAverage(3);


```

### *h)* 

```
... Write here your answer ...
```

### *i)* 

```
As Stored Procedures podem devolver zero, um ou vários resultados, permitem parâmetros de entrada e saída, não podem ser usadas em SELECT/WHERE/HAVING, mas podem chamar outras SPs. Suportam exceções e transações.

As Funções (UDFs) devolvem apenas um valor (escalar ou tabela), aceitam só parâmetros de entrada, podem ser usadas em SELECT/WHERE/HAVING, mas não podem chamar SPs. Não suportam exceções nem transações.

```
