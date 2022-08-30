/**
 *@file main.c
 *@brief executes main gtk graphical user interface
 */

#include <gtk/gtk.h>
#include "../inc/project_function.h"

/*
//TODO: 1) when "save" button is selected classroom will be created and the entry are not more editable, only appear as label
        2) create a view3 where the user can ask for direct and indirect neighbour
        3) create a callback function, that saves the generated pattern in create_view2();
*/

static void
display_pattern(int rows, int cols, GtkWidget *window, GtkWidget **entry, GtkWidget **hbox, GtkWidget *vbox);

_Noreturn static void remove_child_widget(GtkWidget *widget);

/**
 *@brief loads first window for user interaction
 */
int main(int argc, char **argv) {

    ///1. Allocate GUI Objects for first window
    widget = malloc(sizeof(*widget));
    gtk_init(&argc, &argv);

    GtkCssProvider *provider;
    GdkDisplay *display;
    GdkScreen *screen;
    provider = gtk_css_provider_new ();
    display = gdk_display_get_default ();
    screen = gdk_display_get_default_screen (display);
    gtk_style_context_add_provider_for_screen (screen, GTK_STYLE_PROVIDER (provider),  GTK_STYLE_PROVIDER_PRIORITY_USER);

    const gchar *myCssFile = "src/theme.css";
    GError *error = 0;
    gtk_css_provider_load_from_file(provider, g_file_new_for_path(myCssFile), &error);
    g_object_unref (provider);

    GtkWidget *window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    GtkWidget *vbox = gtk_box_new(GTK_ORIENTATION_VERTICAL, 10);
    /*view wird erneut übergeben zum testen.*/
    widget->view1 = create_view1(widget);

    widget->frame = gtk_box_new(GTK_ORIENTATION_VERTICAL, 10);

    g_object_ref (widget->view1);

    ///2. Assign Process termination if window is closed
    g_signal_connect (window, "destroy", G_CALLBACK(gtk_main_quit), NULL);

    ///3. Load first window view1 into frame for user interaction
    gtk_box_pack_start(GTK_BOX (widget->frame), widget->view1, 10, 10, 10);
    gtk_box_pack_start(GTK_BOX (vbox), widget->frame, 10, 10, 10);

    gtk_widget_set_size_request(window, 400, 400);
    gtk_window_set_position(GTK_WINDOW(window), GTK_WIN_POS_CENTER);
    gtk_window_set_default_size(GTK_WINDOW(window), 800, 800);

    gtk_container_add(GTK_CONTAINER (window), vbox);
    gtk_widget_show_all(window);

    gtk_main();
    

    return 0;
}
/*
  printf("%d\n", reference_cnt_view1);
  printf("%d\n", reference_cnt_view2);
  printf("%d\n", reference_cnt_view3);
*/
/* ONLY FOR MEMORY_LEAK_PURPOSE */
/*
    for (int i = 0; i < reference_cnt_view1; ++i) {
        g_object_ref_sink(G_OBJECT(widget->view1)); // convert floating ref to standard ref
        gtk_widget_destroy(widget->view1); // break external references
        g_object_unref(G_OBJECT(widget->view1));
    }
    */
/*
for (int i = 0; i < reference_cnt_view2; ++i) {
    g_object_ref_sink(G_OBJECT(widget->view2)); // convert floating ref to standard ref
    gtk_widget_destroy (widget->view2); // break external references
    g_object_unref (G_OBJECT(widget->view2));
}*//*
    for (int i = 0; i < reference_cnt_view3; ++i) {
        g_object_ref_sink(G_OBJECT(widget->view3)); // convert floating ref to standard ref
        gtk_widget_destroy (widget->view3); // break external references
        g_object_unref (G_OBJECT(widget->view3));
    }
*/
