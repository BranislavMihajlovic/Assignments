import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.resource.transaction.spi.TransactionStatus;
import javax.persistence.Query;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.*;
import java.util.List;

public class Program extends JFrame {

    public static class Frame extends JFrame {
        static JFrame frame;
        static void start() {
            frame = new JFrame();
        }
    }
    public static void main(String[] args) throws SQLException {
        Session session = HibernateUtil.createSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            transaction.commit();
        }
        catch(HibernateException ex) {
            if(transaction != null) {
                transaction.rollback();
            }
            System.out.println(ex);
        }
        finally {
            HibernateUtil.close();
        }
        Frame frame = new Frame();
        frame.setLayout(null);
        frame.setSize(1000,330);
        frame.setLocationRelativeTo(null);
        frame.setDefaultCloseOperation(EXIT_ON_CLOSE);


        JLabel all_select = new JLabel("Show all staff -");
        all_select.setBounds(10,5,120,30);
        JTextArea all_staff = new JTextArea();
        all_staff.setBounds(230,5,750,80);
        all_staff.setWrapStyleWord(false);
        all_staff.setLineWrap(true);
        JScrollPane scroll = new JScrollPane(all_staff);
        scroll.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_ALWAYS);
        JButton all_button = new JButton("PRESS");
        all_button.setBounds(140,5,80,30);
        all_button.setFocusable(false);
        all_button.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                Session session = HibernateUtil.createSessionFactory().openSession();
                Transaction transaction = null;
                try {
                    transaction = session.beginTransaction();
                    List<Staff> staff_list;
                    String sql = "from Staff";
                    Query query = session.createQuery(sql);
                    staff_list = query.getResultList();
                    for(Object staff : staff_list) {
                        all_staff.setText(staff_list.toString());
                        if (transaction.getStatus().equals(TransactionStatus.ACTIVE)) {
                            transaction.commit();
                        }
                    }
                } catch(HibernateException ex) {
                    if(transaction != null) {
                        transaction.rollback();
                    }
                }
                finally { HibernateUtil.close(); }
            }
        });


        JLabel insert = new JLabel("Insert new staff -");
        insert.setBounds(5, 100, 130, 30);
        JLabel insert_name = new JLabel("Name:");
        insert_name.setBounds(120,100,70,30);
        JTextField textField_insert_name = new JTextField();
        textField_insert_name.setBounds(160, 100, 130, 30);
        textField_insert_name.setBackground(Color.white);
        JLabel insert_age = new JLabel("Age:");
        insert_age.setBounds(300,100,60,30);
        JTextField textField_insert_age = new JTextField();
        textField_insert_age.setBounds(330, 100, 40, 30);
        textField_insert_age.setBackground(Color.white);
        JLabel insert_address = new JLabel("Address:");
        insert_address.setBounds(380,100,70,30);
        JTextField textField_insert_address = new JTextField();
        textField_insert_address.setBounds(435, 100, 170, 30);
        textField_insert_address.setBackground(Color.white);
        JLabel insert_salary = new JLabel("Salary:");
        insert_salary.setBounds(615,100,60,30);
        JTextField textField_insert_salary = new JTextField();
        textField_insert_salary.setBounds(665, 100, 60, 30);
        textField_insert_salary.setBackground(Color.white);
        JButton insert_button = new JButton("CREATE");
        insert_button.setBounds(760, 100, 90, 30);
        insert_button.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                Session session = HibernateUtil.createSessionFactory().openSession();
                Transaction transaction = null;
                try {
                    int age = Integer.parseInt(textField_insert_age.getText());
                    int salary = Integer.parseInt(textField_insert_salary.getText());
                    transaction = session.beginTransaction();
                    Staff new_staff = new Staff();
                    String name = textField_insert_name.getText();
                    new_staff.setIme(name);
                    new_staff.setBroj_godina(age);
                    new_staff.setAdresa(textField_insert_address.getText());
                    new_staff.setVisina_dohotka(salary);
                    session.persist(new_staff);
                    transaction.commit();
                }
                catch (HibernateException ex) {
                    if(transaction != null) {
                        transaction.rollback();
                    }
                }
                finally { HibernateUtil.close(); }
            }
        });


        JLabel update = new JLabel("Enter id:");
        update.setBounds(5,150,100,30);
        JTextField update_id = new JTextField();
        update_id.setBounds(60,150,50,30);
        update_id.setBackground(Color.white);
        JLabel update_name = new JLabel("Name:");
        update_name.setBounds(120, 150, 50, 30);
        JTextField textField_update_name = new JTextField();
        textField_update_name.setBounds(160, 150, 130, 30);
        textField_update_name.setBackground(Color.white);
        JLabel update_age = new JLabel("Age:");
        update_age.setBounds(300,150,60,30);
        JTextField textField_update_age = new JTextField();
        textField_update_age.setBounds(330,150,40,30);
        textField_update_age.setBackground(Color.white);
        JLabel update_address = new JLabel("Address:");
        update_address.setBounds(380,150,70,30);
        JTextField updateAddress = new JTextField();
        updateAddress.setBounds(435, 150, 170, 30);
        updateAddress.setBackground(Color.white);
        JLabel update_salary = new JLabel("Salary:");
        update_salary.setBounds(615,150,60,30);
        JTextField textField_update_salary = new JTextField();
        textField_update_salary.setBounds(665, 150, 60, 30);
        textField_update_salary.setBackground(Color.white);
        JButton update_button = new JButton("UPDATE");
        update_button.setBounds(760, 150, 90, 30);
        update_button.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                Session session = HibernateUtil.createSessionFactory().openSession();
                Transaction transaction = null;
                try {
                    transaction = session.beginTransaction();
                    String id = update_id.getText();
                    int id_update = Integer.parseInt(id);
                    String name_update = textField_update_name.getText();
                    int age_update = Integer.parseInt(textField_update_age.getText());
                    String address_update = updateAddress.getText();
                    int salary_update = Integer.parseInt(textField_update_salary.getText());
                    JButton button = (JButton) e.getSource();
                    Staff update_staff = (Staff) session.get(Staff.class, id_update);
                    update_staff.setIme(name_update);
                    update_staff.setAdresa(address_update);
                    update_staff.setBroj_godina(age_update);
                    update_staff.setVisina_dohotka(salary_update);
                    session.update(update_staff);
                    transaction.commit();
                }
                catch(HibernateException ex) {
                    if(transaction != null) {
                        transaction.rollback();
                    }
                }
                finally { HibernateUtil.close(); }
            }
        });


        JLabel delete = new JLabel("insert staff id:");
        delete.setBounds(5, 200, 160, 30);
        JTextField textField_delete_id = new JTextField();
        textField_delete_id.setBounds(90, 200, 50, 30);
        textField_delete_id.setBackground(Color.white);
        JButton delete_button = new JButton("DELETE");
        delete_button.setBounds(170, 200, 90, 30);
        delete_button.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                Session session = HibernateUtil.createSessionFactory().openSession();
                Transaction transaction = null;
                try {
                    transaction = session.beginTransaction();
                    int delete = Integer.parseInt(textField_delete_id.getText());
                    Staff delete_staff = (Staff) session.get(Staff.class, delete);
                    session.delete(delete_staff);
                    transaction.commit();
                }
                catch(HibernateException ex) {
                    if(transaction != null) {
                        transaction.rollback();
                    }
                }
                finally { HibernateUtil.close(); }
            }
        });


        JLabel select_name = new JLabel("Enter name:");
        select_name.setBounds(5, 250, 100, 30);
        JTextField textField_select_name = new JTextField();
        textField_select_name.setBounds(80, 250, 130, 30);
        textField_select_name.setBackground(Color.white);
        JTextField textField_results = new JTextField();
        textField_results.setBounds(350, 250, 500, 30);
        JButton select_button = new JButton("PRESS");
        select_button.setBounds(230, 250, 100, 30);
        select_button.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                Session session = HibernateUtil.createSessionFactory().openSession();
                Transaction transaction = null;
                try {
                    transaction = session.beginTransaction();
                    String sql = "from Staff e where e.ime like :name";
                    Query query=session.createQuery(sql);
                    query.setParameter("name", textField_select_name.getText());
                    List<Staff> staffList = query.getResultList();
                    for(Staff staff : staffList) {
                       textField_results.setText(String.valueOf(staff));
                    }
                    transaction.commit();
                } catch (HibernateException ex){
                    if (transaction != null){
                        transaction.rollback();
                    }
                    ex.printStackTrace();
                } finally { HibernateUtil.close(); }
            }
        });

        frame.add(all_select);
        frame.add(select_name);
        frame.add(all_button);
        frame.add(scroll);
        frame.add(all_staff);
        frame.add(insert);
        frame.add(insert_name);
        frame.add(textField_insert_name);
        frame.add(insert_age);
        frame.add(textField_insert_age);
        frame.add(insert_address);
        frame.add(textField_insert_address);
        frame.add(insert_salary);
        frame.add(textField_insert_salary);
        frame.add(insert_button);
        frame.add(update);
        frame.add(update_id);
        frame.add(update_name);
        frame.add(textField_update_name);
        frame.add(update_age);
        frame.add(textField_update_age);
        frame.add(update_address);
        frame.add(updateAddress);
        frame.add(update_salary);
        frame.add(textField_update_salary);
        frame.add(update_button);
        frame.add(delete);
        frame.add(textField_delete_id);
        frame.add(delete_button);
        frame.add(textField_select_name);
        frame.add(select_button);
        frame.add(textField_results);

        frame.setVisible(true);
    }
}