/* window.vala
 *
 * Copyright 2022 Suraj Yadav
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

using Soup;
using IGDB;
using Json;

namespace Reflections {

    [GtkTemplate (ui = "/com/jarusll/reflections/window.ui")]
    public class Window : Gtk.ApplicationWindow {
        [GtkChild]
        private unowned Gtk.Label label;

        [GtkChild]
        private unowned Gtk.Button open_button;

        public Window (Gtk.Application app) {
            var games = new Client().search("game", "fields *; limit 1");
            print ("Data: \n%s\n", (string) games);
            var jsonString = @"{\"hello\": \"world\"}";
            var parser = new Parser();
            parser.load_from_data(jsonString);
            var root = parser.get_root().get_object ();
            message((string)root.get_string_member("hello"));
            GLib.Object (application: app);
        }
    }
}
