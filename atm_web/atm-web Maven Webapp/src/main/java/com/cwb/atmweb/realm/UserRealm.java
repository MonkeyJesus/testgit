package com.cwb.atmweb.realm;

import java.util.Collection;
import java.util.Iterator;
import java.util.Set;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ByteSource;
import org.apache.shiro.util.SimpleByteSource;
import org.springframework.beans.factory.annotation.Autowired;









import com.cwb.atmweb.entity.Account;
import com.cwb.atmweb.entity.Employee;
import com.cwb.atmweb.service.AccountService;
import com.cwb.atmweb.service.EmployeeService;
import com.cwb.atmweb.service.ResourceService;
import com.cwb.atmweb.service.RoleService;

import sun.security.krb5.Realm;

public class UserRealm extends AuthorizingRealm {

	@Autowired
	private RoleService roleService;

	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private AccountService accountService;
	
	@Autowired
	private ResourceService resourceService;
	
	/**
	 * 授权
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		
		String username = ((String)principals.getPrimaryPrincipal()).substring(2);
		String info = ((String)principals.getPrimaryPrincipal()).split("_")[0];
		
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        authorizationInfo.setRoles(roleService.selectByPrimaryKey(username));
        authorizationInfo.setStringPermissions(resourceService.getPermissions(username));
        return authorizationInfo;
	}
	
	
	/**
	 * 验证
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {
		if(((UsernamePasswordToken) token).getPrincipal()==null){
			return null;
		}
		UsernamePasswordToken uptoken = (UsernamePasswordToken) token;
		String[] strs = uptoken.getUsername().split("_");
		if(strs[0].equals("1")){
			Employee employee = employeeService.selectByUsername(((UsernamePasswordToken) token).getUsername().substring(2));
			if (employee != null) {
				
				SimpleAuthenticationInfo authcInfo = new SimpleAuthenticationInfo("0_"+employee.getEmployeename(), employee.getPassword(), getName());
				authcInfo.setCredentialsSalt(ByteSource.Util.bytes(employee.getEmployeename()+employee.getSalt()));
				
				this.setSession("currentUser", employee);
				return authcInfo;
			} else {
				return null;
			}
		}else{
			Account account = accountService.selectByUsername(((UsernamePasswordToken) token).getUsername().substring(2));
			if (account != null) {
				
				SimpleAuthenticationInfo authcInfo = new SimpleAuthenticationInfo("1_"+account.getUsername(), account.getPassword(), getName());
				authcInfo.setCredentialsSalt(ByteSource.Util.bytes(account.getUsername()+account.getSalt()));
				
				this.setSession("currentUser", account);
				return authcInfo;
			} else {
				return null;
			}
		}
	}

	private void setSession(Object key, Object value) {
		Subject currentUser = SecurityUtils.getSubject();
		if (null != currentUser) {
			Session session = currentUser.getSession();
			if (null != session) {
				session.setAttribute(key, value);
			}
		}
	}

	
}
