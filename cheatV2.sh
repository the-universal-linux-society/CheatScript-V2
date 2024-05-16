#! /bin/bash
echo "-------------"
echo "CHEATSCRIPT v2"
echo "-------------"
echo "https://github.com/the-universal-linux-society"
sleep 2 
echo 
display_menu(){
	echo "Make your choice: "
	echo 
	echo "1. Interactive Cheat-Sheet"
	echo 
	echo "2. Download PDF man-pages"
	echo 
	echo "3. Exit"
	echo
}
while true; do
	display_menu
	read -p "Enter your choice: " choice

	case $choice in 
		1) 
		echo "Running the Interactive Cheat-Sheet: "
		sudo apt --no-upgrade install tldr && tldr --update
while true; do
echo ""
read -p "Enter the command you want information on (or type 'quit' to exit) : " user_command
echo ""
# function to allow to quit the loop #
if [ "$user_command" = "quit" ]; then
	echo "Exiting..." 
	break
	fi
tldr "$user_command"

# give the option to continue using the script #
echo ""
read -p "Do you want to search for something else? (y/n):" continue_choice
if [ "$continue_choice" = "n" ]; then
	echo "Exiting"
	break
fi
done
;;
2) echo "Download man-pages in PDF: "
echo "Enter the man-page you want as PDF : "
read command_name

man -t $command_name | ps2pdf - ${command_name}_man-page.pdf
echo "PDF created for $command_name."
;;
3) echo "Exiting..."
exit 0
;;
*)
echo "Invalid choice"
;;
esac
done

















