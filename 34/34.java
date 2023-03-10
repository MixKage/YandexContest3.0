// https://site.ada.edu.az/~medv/acm/Docs%20e-olimp/Volume%2020/1948.htm
import java.util.*;
import java.io.*;
 
public class Main
{
  static ArrayList<ArrayList<Integer>> g;
  static ArrayList<Integer> top = new ArrayList<Integer>();
  static int used[];
  static int n, m, flag = 0;
   
  static void dfs(int v)
  {
    used[v] = 1;
    for(int i = 0; i < g.get(v).size(); i++)
    {
      int to = g.get(v).get(i);
      if (used[to] == 1) flag = 1;
      if (used[to] == 0) dfs(to);
    }
    used[v] = 2;
    top.add(v);
  }
   
  public static void main(String[] args)
  {
    FastScanner con = new FastScanner(System.in);
    n = con.nextInt();
    m = con.nextInt();
    g = new ArrayList<ArrayList<Integer>>();
    used = new int[n+1];
     
    for (int i = 0; i <= n; i++)
      g.add(new ArrayList<Integer>());
 
    for (int i = 0; i < m; i++)
    {
      int a = con.nextInt();
      int b = con.nextInt();    
      g.get(a).add(b);
    }
     
    for(int i = 1; i <= n; i++)
      if (used[i] == 0) dfs(i);
     
    if (flag == 1) System.out.println("-1");
    else
      for(int i = top.size() - 1; i >= 0; i--)
        System.out.print(top.get(i) + " ");
    System.out.println();
  }
}
 
class FastScanner
{
  BufferedReader br;
  StringTokenizer st;
 
  public FastScanner(InputStream inputStream)
  {
    br = new BufferedReader(new InputStreamReader(inputStream));
    st = new StringTokenizer("");
  }
 
  public String next()
  {
    while (!st.hasMoreTokens())
    {
      try
      {
        st = new StringTokenizer(br.readLine());
      } catch (Exception e)
      {
        return null;
      }
    }
    return st.nextToken();
  }
 
  public int nextInt()
  {
    return Integer.parseInt(next());
  }
}
