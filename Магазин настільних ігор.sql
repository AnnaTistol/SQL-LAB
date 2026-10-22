CREATE TABLE [employee] (
	[employee_id] int NOT NULL,
	[user_name] nvarchar(30) NOT NULL,
	[first_name] nvarchar(30) NOT NULL,
	[last_name] nvarchar(30) NOT NULL,
	[position] nvarchar(15) NOT NULL,
	[store_id] int,
	[employment_date] date NOT NULL,
	[manager_id] int,
	[salary] float(53),
	PRIMARY KEY ([employee_id])
);
CREATE TABLE [store] (
	[store_id] int NOT NULL,
	[store_name] nvarchar(30) NOT NULL,
	[city] nvarchar(30) NOT NULL,
	[street] nvarchar(40) NOT NULL,
	[building_no] int NOT NULL,
	[phone_number] int,
	PRIMARY KEY ([store_id])
);
CREATE TABLE [orders] (
	[orders_id] int IDENTITY(1,1) NOT NULL,
	[employee_id] int NOT NULL,
	[customer_id] int NOT NULL,
	[game_id] int NOT NULL,
	[amount] int NOT NULL,
	[transaction_type] int NOT NULL,
	[transaction_moment] datetime NOT NULL,
	PRIMARY KEY ([orders_id])
);
CREATE TABLE [game] (
	[game_id] int NOT NULL,
	[game_name] nvarchar(40) NOT NULL,
	[game_description] nvarchar(150) NOT NULL,
	[category] nvarchar(30) NOT NULL,
	[min_players] int NOT NULL,
	[play_time] time(7) NOT NULL,
	[stock_amount] int NOT NULL,
	[publisher_id] int NOT NULL,
	[price] float(53) NOT NULL,
	[min_age] int NOT NULL,
	PRIMARY KEY ([game_id])
);
CREATE TABLE [customer] (
	[customer_id] int IDENTITY(1,1) NOT NULL,
	[first_name] nvarchar(30) NOT NULL,
	[last_name] nvarchar(30) NOT NULL,
	[birth_date] date NOT NULL,
	[phone_number] int NOT NULL,
	[email] nvarchar(50) NOT NULL,
	[discount] int NOT NULL,
	PRIMARY KEY ([customer_id])
);
CREATE TABLE [publisher] (
	[publisher_id] int NOT NULL,
	[publisher_name] nvarchar(30) NOT NULL,
	[country] nvarchar(30) NOT NULL,
	[website] nvarchar(max) NOT NULL,
	[phone_number] int NOT NULL,
	PRIMARY KEY ([publisher_id])
);
ALTER TABLE [employee] ADD CONSTRAINT [employee_fk5] FOREIGN KEY ([store_id]) REFERENCES [store]([store_id]);
ALTER TABLE [employee] ADD CONSTRAINT [employee_fk7] FOREIGN KEY ([manager_id]) REFERENCES [employee]([employee_id]);
ALTER TABLE [orders] ADD CONSTRAINT [orders_fk1] FOREIGN KEY ([employee_id]) REFERENCES [employee]([employee_id]);
ALTER TABLE [orders] ADD CONSTRAINT [orders_fk2] FOREIGN KEY ([customer_id]) REFERENCES [customer]([customer_id]);
ALTER TABLE [orders] ADD CONSTRAINT [orders_fk3] FOREIGN KEY ([game_id]) REFERENCES [game]([game_id]);
ALTER TABLE [game] ADD CONSTRAINT [game_fk7] FOREIGN KEY ([publisher_id]) REFERENCES [publisher]([publisher_id]);