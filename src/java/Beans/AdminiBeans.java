
package Beans;

public class AdminiBeans {
  private String  codigo;
  private String  nombre;
  private int edad;
  private String  perfil;
  private String  pas;

    public AdminiBeans(String codigo, String nombre, int edad, String perfil, String pas) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.edad = edad;
        this.perfil = perfil;
        this.pas = pas;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getPerfil() {
        return perfil;
    }

    public void setPerfil(String perfil) {
        this.perfil = perfil;
    }

    public String getPas() {
        return pas;
    }

    public void setPas(String pas) {
        this.pas = pas;
    }
            
}
