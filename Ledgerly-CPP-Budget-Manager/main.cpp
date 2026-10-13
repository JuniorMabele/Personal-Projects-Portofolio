#include <algorithm>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <sstream>
#include <string>
#include <vector>
using namespace std;

struct Transaction { string date, category, note; double amount; bool income; };
const string FILE_NAME = "transactions.csv";
vector<Transaction> records;

void load() { ifstream file(FILE_NAME); string line; while (getline(file,line)) { stringstream s(line), field; vector<string> v; while(getline(s,field,',')) v.push_back(field); if(v.size()==5) records.push_back({v[0],v[1],v[3],stod(v[2]),v[4]=="income"}); } }
void save() { ofstream file(FILE_NAME); for(auto &t: records) file<<t.date<<","<<t.category<<","<<fixed<<setprecision(2)<<t.amount<<","<<t.note<<","<<(t.income?"income":"expense")<<"\n"; }
void addTransaction() { Transaction t; string amount, kind; cout<<"Date (YYYY-MM-DD): "; getline(cin,t.date); cout<<"Category: "; getline(cin,t.category); cout<<"Amount: "; getline(cin,amount); cout<<"Note: "; getline(cin,t.note); cout<<"Type (income/expense): "; getline(cin,kind); t.amount=stod(amount); t.income=kind=="income"; records.push_back(t); save(); cout<<"Transaction saved.\n"; }
void summary() { double income=0, expense=0; for(auto&t:records) t.income?income+=t.amount:expense+=t.amount; cout<<"\n--- MONTHLY SUMMARY ---\nIncome:  $"<<fixed<<setprecision(2)<<income<<"\nSpent:   $"<<expense<<"\nBalance: $"<<income-expense<<"\n\nSpending by category:\n"; vector<string> cats; for(auto&t:records) if(!t.income&&find(cats.begin(),cats.end(),t.category)==cats.end()) cats.push_back(t.category); for(auto&c:cats){double total=0;for(auto&t:records)if(!t.income&&t.category==c)total+=t.amount;cout<<"  "<<left<<setw(18)<<c<<" $"<<total<<"\n";} }
void listTransactions() { cout<<"\nDATE         CATEGORY          AMOUNT       TYPE       NOTE\n"; for(auto&t:records) cout<<left<<setw(13)<<t.date<<setw(18)<<t.category<<"$"<<setw(11)<<fixed<<setprecision(2)<<t.amount<<setw(11)<<(t.income?"income":"expense")<<t.note<<"\n"; }
int main(){load(); cout<<"\n=== LEDGERLY | PERSONAL FINANCE MANAGER ===\n"; bool running=true; while(running){cout<<"\n1. Add transaction\n2. View summary\n3. List transactions\n0. Exit\nChoose: ";string choice;getline(cin,choice);try{if(choice=="1")addTransaction();else if(choice=="2")summary();else if(choice=="3")listTransactions();else if(choice=="0")running=false;else cout<<"Choose a valid option.\n";}catch(exception&e){cout<<"Invalid input: please try again.\n";}} cout<<"Goodbye.\n";}
