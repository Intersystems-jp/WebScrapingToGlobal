Class User.UserPythonTest2 Extends %Persistent
{

ClassMethod test() [ Language = python ]
{
	
    import pandas as pd
    mysql = "select name,value from %library.global_get('user','^ISJ()',,2,2)"
    resultset = iris.sql.exec(mysql)
    dataframe = resultset.dataframe()
    
    print (dataframe)
}

Storage Default
{
<Data name="UserPythonTest2DefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
</Data>
<DataLocation>^User.UserPythonTest2D</DataLocation>
<DefaultData>UserPythonTest2DefaultData</DefaultData>
<IdLocation>^User.UserPythonTest2D</IdLocation>
<IndexLocation>^User.UserPythonTest2I</IndexLocation>
<StreamLocation>^User.UserPythonTest2S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
