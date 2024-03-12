package ma.ac.esi.referentielCompetences.model;

public class User {
	public String login;
	public String password;
	public User(String login, String password) {
		super();
		this.login = login;
		this.password = password;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
