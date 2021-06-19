<cfcomponent hint="login-process-cfc">
    <cffunction name="secureLoginProcess" access="public" returntype="query">
        <cfargument name="userName" type="string" required="true">
        <cfargument name="password" type="string" required="true">
        <cfset local.loginCheck = ''>
        <cfquery name="local.loginCheck" datasource="demoSource">
            SELECT * FROM emailUsers
                WHERE userName = <cfqueryparam value="#arguments.userName#" cfsqltype="cf_sql_varchar">
                AND userPassword = <cfqueryparam value="#arguments.password#" cfsqltype="cf_sql_varchar">
        </cfquery>
        <cfreturn local.loginCheck>
    </cffunction>
</cfcomponent>