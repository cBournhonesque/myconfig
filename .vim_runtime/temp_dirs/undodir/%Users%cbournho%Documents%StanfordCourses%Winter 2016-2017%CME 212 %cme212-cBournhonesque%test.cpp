Vim�UnDo� ��\dY��ë��ē�t�
���w��%S�.�
�   -   #include "shortest_path.hpp"            M       M   M   M    X��   ; _�                             ����                                                                                                                                                                                                                                                                                                                                                  v        X��]     �          K      /**    * @file viewer.cpp   , * Test script for the SFML_Viewer and Graph    *   ; * @brief Reads in two files specified on the command line.   @ * First file: 3D Points (one per line) defined by three doubles   R * Second file: Tetrahedra (one per line) defined by 4 indices into the point list    *   	 * Prints    * A B    * where A = number of nodes    *       B = number of edges   7 * and launches an SFML_Viewer to visualize the system.    */5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  v        X��^     �                 */5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  v        X��b    �                !#include "CME212/SFML_Viewer.hpp"5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       X��@     �   
      <        // Check arguments     if (argc < 3) {   C    std::cerr << "Usage: " << argv[0] << " NODES_FILE TETS_FILE\n";       exit(1);     }5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       X��A     �   
               5�_�                            ����                                                                                                                                                                                                                                                                                                                                                v       X��B     �   
              5�_�                            ����                                                                                                                                                                                                                                                                                                                                                v       X��C    �                 5�_�      	                      ����                                                                                                                                                                                                                                                                                                                                       &           v        X���     �         5      6  // Create a nodes_file from the first input argument   $  std::ifstream nodes_file(argv[1]);   M  // Interpret each line of the nodes_file as a 3D Point and add to the Graph   
  Point p;   /  while (CME212::getline_parsed(nodes_file, p))   '    nodes.push_back(graph.add_node(p));       6  // Create a tets_file from the second input argument   #  std::ifstream tets_file(argv[2]);   K  // Interpret each line of the tets_file as four ints which refer to nodes     std::array<int,4> t;   .  while (CME212::getline_parsed(tets_file, t))   +    for (unsigned i = 1; i < t.size(); ++i)   &      for (unsigned j = 0; j < i; ++j)   1        graph.add_edge(nodes[t[i]], nodes[t[j]]);           $  // Print number of nodes and edges   J  std::cout << graph.num_nodes() << " " << graph.num_edges() << std::endl;        5�_�      
           	           ����                                                                                                                                                                                                                                                                                                                                                  v        X���     �         !            // Launch a viewer     CME212::SFML_Viewer viewer;       ;  //viewer.draw_graph_nodes(graph);  // Draw only the nodes5�_�   	              
           ����                                                                                                                                                                                                                                                                                                                                                  v        X��     �            
   ;  //viewer.draw_graph_nodes(graph);  // Draw only the nodes   >  //viewer.draw_graph(graph);      // Draw the nodes and edges   /  auto node_map = viewer.empty_node_map(graph);   C  viewer.add_nodes(graph.node_begin(), graph.node_end(), node_map);       ?  // Center the view and enter the event loop for interactivity     viewer.center_view();     viewer.event_loop();         return 0;5�_�   
                         ����                                                                                                                                                                                                                                                                                                                                                  v        X��    �                 �             5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  v        X���     �                 }�               5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  v        X���     �               <a  //viewer.draw_graph_nodes(graph);  // Draw only the nodes5�_�                       (    ����                                                                                                                                                                                                                                                                                                                                                  v        X���     �                a    graph.add_node ( Point (1 ,1 ,1) , 3//viewer.draw_graph_nodes(graph);  // Draw only the nodes5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  v        X��     �         &      //5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  v        X��     �         &      /5�_�                            ����                                                                                                                                                                                                                                                                                                                                       %           v        X��     �              
   <// //viewer.draw_graph_nodes(graph);  // Draw only the nodes   >  //viewer.draw_graph(graph);      // Draw the nodes and edges   /  auto node_map = viewer.empty_node_map(graph);   C  viewer.add_nodes(graph.node_begin(), graph.node_end(), node_map);       ?  // Center the view and enter the event loop for interactivity     viewer.center_view();     viewer.event_loop();        5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  v        X��     �                  5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  v        X��     �               3// graph.node(1).value () = graph.node (0).value();5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  v        X��     �               2/ graph.node(1).value () = graph.node (0).value();5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  v        X��     �               // // Work with the values5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  v        X��     �               / // Work with the values5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  v        X��     �               %// graph.add_node ( Point (0 ,0 ,0));5�_�                             ����                                                                                                                                                                                                                                                                                                                                                  v        X��     �               $/ graph.add_node ( Point (0 ,0 ,0));5�_�      !                      ����                                                                                                                                                                                                                                                                                                                                                  v        X��     �               # graph.add_node ( Point (0 ,0 ,0));5�_�       "           !          ����                                                                                                                                                                                                                                                                                                                                                  v        X��      �               -    graph.add_node ( Point (1 ,1 ,1) , 3.14);5�_�   !   #           "           ����                                                                                                                                                                                                                                                                                                                                                  v        X��!     �               a  th position and value = 3.145�_�   "   $           #          ����                                                                                                                                                                                                                                                                                                                                                  v        X��$     �               !//a  th position and value = 3.145�_�   #   %           $           ����                                                                                                                                                                                                                                                                                                                                                  v        X��8     �                  return 0;5�_�   $   &           %           ����                                                                                                                                                                                                                                                                                                                                                  v        X��8     �               ,    graph.add_node( Point (1 ,1 ,1) , 3.14);5�_�   %   '           &           ����                                                                                                                                                                                                                                                                                                                                                  v        X��9     �               +   graph.add_node( Point (1 ,1 ,1) , 3.14);5�_�   &   (           '           ����                                                                                                                                                                                                                                                                                                                                                  v        X��9     �               *  graph.add_node( Point (1 ,1 ,1) , 3.14);5�_�   '   *           (           ����                                                                                                                                                                                                                                                                                                                                                  v        X��:    �                �             5�_�   (   +   )       *          ����                                                                                                                                                                                                                                                                                                                                                  v        X��c     �                 GraphType graph;5�_�   *   ,           +          ����                                                                                                                                                                                                                                                                                                                                                  v        X��i    �                 GraphType<float? graph;5�_�   +   -           ,          ����                                                                                                                                                                                                                                                                                                                                                  v        X��t     �                 GraphType<float> graph;5�_�   ,   .           -          ����                                                                                                                                                                                                                                                                                                                                                  v        X��x     �                 using GraphType = Graph;5�_�   -   /           .          ����                                                                                                                                                                                                                                                                                                                                                  v        X��i   ! �                �             5�_�   .   0           /          ����                                                                                                                                                                                                                                                                                                                                                  v        X��   " �               4 asser(graph.has_edge(graph.node(0), graph.node(1));5�_�   /   1           0      4    ����                                                                                                                                                                                                                                                                                                                                                  v        X���   & �               5 assert(graph.has_edge(graph.node(0), graph.node(1));5�_�   0   2           1          ����                                                                                                                                                                                                                                                                                                                                                  v        X��     �               . graph.add_edge(graph.node(0), graph.node(1));5�_�   1   3           2          ����                                                                                                                                                                                                                                                                                                                                                  v        X��   , �               6 assert(graph.has_edge(graph.node(0), graph.node(1)));5�_�   2   4           3          ����                                                                                                                                                                                                                                                                                                                                                  v        X��-     �               0 //graph.add_edge(graph.node(0), graph.node(1));5�_�   3   5           4          ����                                                                                                                                                                                                                                                                                                                                                  v        X��-   - �               / /graph.add_edge(graph.node(0), graph.node(1));5�_�   4   6           5          ����                                                                                                                                                                                                                                                                                                                                                  v        X��2     �               8 //assert(graph.has_edge(graph.node(0), graph.node(1)));5�_�   5   7           6          ����                                                                                                                                                                                                                                                                                                                                                  v        X��2   7 �               7 /assert(graph.has_edge(graph.node(0), graph.node(1)));5�_�   6   8           7          ����                                                                                                                                                                                                                                                                                                                                                 v���    X��}     �                //  th position and value = 3.145�_�   7   9           8          ����                                                                                                                                                                                                                                                                                                                                                 v���    X��}     �               // th position and value = 3.145�_�   8   :           9          ����                                                                                                                                                                                                                                                                                                                                                 v���    X��}     �               // h position and value = 3.145�_�   9   ;           :          ����                                                                                                                                                                                                                                                                                                                                                 v���    X��~     �               //  position and value = 3.145�_�   :   <           ;          ����                                                                                                                                                                                                                                                                                                                                                 v���    X���     �                 �             5�_�   ;   =           <      !    ����                                                                                                                                                                                                                                                                                                                                                 v���    X���     �         "       �         !    5�_�   <   >           =          ����                                                                                                                                                                                                                                                                                                                                                 v���    X���     �          #       �         "    5�_�   =   ?           >   !       ����                                                                                                                                                                                                                                                                                                                                                 v���    X���     �   !   %   %       �   !   #   $    5�_�   >   @           ?   #        ����                                                                                                                                                                                                                                                                                                                                                 v���    X���     �   "   $   '       5�_�   ?   A           @          ����                                                                                                                                                                                                                                                                                                                                                 v���    X���     �         '      1 graph.node(1).value () = graph.node (0).value();5�_�   @   B           A          ����                                                                                                                                                                                                                                                                                                                                                 v���    X���     �         '       graph.node(1).value () = ;5�_�   A   C           B           ����                                                                                                                                                                                                                                                                                                                                                 v���    X���     �         (       �         '    5�_�   B   E           C   #        ����                                                                                                                                                                                                                                                                                                                                                 v���    X���     �   #   &   )       �   #   %   (    5�_�   C   H   D       E           ����                                                                                                                                                                                                                                                                                                                                                 v���    X���     �         +        �         *    5�_�   E   I   F       H           ����                                                                                                                                                                                                                                                                                                                                                 v���    X��u     �         ,       5�_�   H   J           I          ����                                                                                                                                                                                                                                                                                                                                                 v���    X��{     �         -      4  ing NodeIter  = typename GraphType::node_iterator;5�_�   I   K           J          ����                                                                                                                                                                                                                                                                                                                                                 v���    X��     �         -      B   using IncidentIterator = typename GraphType::incident_iterator;5�_�   J   L           K   (        ����                                                                                                                                                                                                                                                                                                                                                 v���    X���     �   '   )   -       5�_�   K   M           L   (       ����                                                                                                                                                                                                                                                                                                                                                 v���    X��C   : �   '   )   -       NodeIter node_iter =  5�_�   L               M          ����                                                                                                                                                                                                                                                                                                                                                 v���    X��   ; �         -      #include "shortest_path.hpp"5�_�   E   G       H   F           ����                                                                                                                                                                                                                                                                                                                                                 v���    X��   8 �         ,       �         ,       5�_�   F               G            ����                                                                                                                                                                                                                                                                                                                                                 v���    X��c     �       !   +       �       "   ,       wer 107 | 2 tickets        Row 26 | Seats 5, 6h5�_�   C           E   D           ����                                                                                                                                                                                                                                                                                                                                                 v���    X���     �         *    �         *      graph.node (0).value()5�_�   (           *   )          ����                                                                                                                                                                                                                                                                                                                                                  v        X���    �               !  using GraphType = Graph<float>;5�_�                          ����                                                                                                                                                                                                                                                                                                                                                  v        X���     �              �             
   <a  //viewer.draw_graph_nodes(graph);  // Draw only the nodes   >  //viewer.draw_graph(graph);      // Draw the nodes and edges   /  auto node_map = viewer.empty_node_map(graph);   C  viewer.add_nodes(graph.node_begin(), graph.node_end(), node_map);       ?  // Center the view and enter the event loop for interactivity     viewer.center_view();     viewer.event_loop();        5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  v        X���     �               a  th position and value = 3.14   I    graph.add_no//viewer.draw_graph_nodes(graph);  // Draw only the nodes5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  v        X���     �                -    graph.add_node ( Point (1 ,1 ,1) , 3.14);   /// Add a node with position and default value .   %// graph.add_node ( Point (0 ,0 ,0));   // // Work with the values   m// graph.node(1).value () = graph.node (0).value();u//viewer.draw_graph_nodes(graph);  // Draw only the nodes5�_�                          ����                                                                                                                                                                                                                                                                                                                                                  v        X���     �              �             
   <a  //viewer.draw_graph_nodes(graph);  // Draw only the nodes   >  //viewer.draw_graph(graph);      // Draw the nodes and edges   /  auto node_map = viewer.empty_node_map(graph);   C  viewer.add_nodes(graph.node_begin(), graph.node_end(), node_map);       ?  // Center the view and enter the event loop for interactivity     viewer.center_view();     viewer.event_loop();        5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  v        X���     �             �            
   <a  //viewer.draw_graph_nodes(graph);  // Draw only the nodes   >  //viewer.draw_graph(graph);      // Draw the nodes and edges   /  auto node_map = viewer.empty_node_map(graph);   C  viewer.add_nodes(graph.node_begin(), graph.node_end(), node_map);       ?  // Center the view and enter the event loop for interactivity     viewer.center_view();     viewer.event_loop();       ;  //viewer.draw_graph_nodes(graph);  // Draw only the nodes�         (    �         (   
   <a  //viewer.draw_graph_nodes(graph);  // Draw only the nodes   >  //viewer.draw_graph(graph);      // Draw the nodes and edges   /  auto node_map = viewer.empty_node_map(graph);   C  viewer.add_nodes(graph.node_begin(), graph.node_end(), node_map);       ?  // Center the view and enter the event loop for interactivity     viewer.center_view();     viewer.event_loop();       ;  //viewer.draw_graph_nodes(graph);  // Draw only the nodes�         1      Ha dd_node ( Po //viewer.draw_graph_nodes(graph);  // Draw only the nodes5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  v        X���     �         1      $a dd_node ( Point (1 ,1 ,1) , 3.14);   /// Add a node with position and default value .   %// graph.add_node ( Point (0 ,0 ,0));   // // Work with the values   m// graph.node(1).value () = graph.node (0).value();u//viewer.draw_graph_nodes(graph);  // Draw only the nodes5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  v        X���     �             �            
   ;  //viewer.draw_graph_nodes(graph);  // Draw only the nodes   >  //viewer.draw_graph(graph);      // Draw the nodes and edges   /  auto node_map = viewer.empty_node_map(graph);   C  viewer.add_nodes(graph.node_begin(), graph.node_end(), node_map);       ?  // Center the view and enter the event loop for interactivity     viewer.center_view();     viewer.event_loop();        5��