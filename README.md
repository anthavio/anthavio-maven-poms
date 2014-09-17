Collection of Maven boms and dependency aggregation poms simplifying dependency management

Most of pom are deployed into [maven central repo](http://repo1.maven.org/maven2/net/anthavio/maven/)

Example: If you are tired of excluding commons-logging from every springframework artifact...

	<dependencyManagement>
		<dependencies>
			<dependency>
				<groupId>net.anthavio.maven</groupId>
				<artifactId>spring-framework-bom</artifactId>
				<version>${spring.version}</version>
				<type>pom</type>
				<scope>import</scope>
			</dependency>
		</dependencies>
	</dependencyManagement>
	
	<dependencies>
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-context</artifactId>
		</dependency>
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-web</artifactId>
		</dependency>
	<dependencies>
